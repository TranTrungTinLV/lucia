import 'package:flutter/material.dart';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';

import 'package:lugia/core/theme.dart';
import 'package:lugia/core/widgets/app_bar_simple.dart';
import 'package:lugia/core/widgets/field_label.dart';
import 'package:lugia/core/widgets/scaffold.dart';
import 'package:lugia/creations/screens/detail.dart';
import 'package:lugia/creations/services/api.dart';

const maxPromptLength = 500;

class CreateCreationScreen extends StatefulWidget {
  const CreateCreationScreen({super.key});

  @override
  State<CreateCreationScreen> createState() => _CreateCreationScreenState();
}

class _CreateCreationScreenState extends State<CreateCreationScreen> {
  final TextEditingController _textFieldController = TextEditingController();

  final GlobalKey _textFieldKey = GlobalKey();

  var _promptLength = 0;

  @override
  void initState() {
    super.initState();

    _textFieldController.addListener(() {
      setState(() {
        _promptLength = _textFieldController.text.length;
      });
    });
  }

  @override
  void dispose() {
    _textFieldController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FreudScaffold(
      appBar: const FreudAppBarSimple(title: 'Creation'),
      builder: (context, padding) {
        final textTheme = Theme.of(context).textTheme;

        return Container(
          padding: padding.copyWith(
            top: padding.top + 8,
            bottom: padding.bottom + 8,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const FreudFieldLabel(text: 'Enter Prompt'),
                const SizedBox(height: 16),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    vertical: 16,
                    horizontal: 16,
                  ),
                  decoration: BoxDecoration(
                    color: Freud.brown90,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextField(
                        key: _textFieldKey,
                        controller: _textFieldController,
                        decoration: InputDecoration(
                          hintText:
                              'Enter the keywords to bring your imagination to life.',
                          hintStyle: theme.textTheme.bodyMedium!.copyWith(
                            color: Freud.gray60,
                            fontWeight: FontWeight.w800,
                          ),
                          contentPadding: EdgeInsets.zero,
                          border: const OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                        ),
                        keyboardType: TextInputType.multiline,
                        style: theme.textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.w800,
                        ),
                        maxLines: 4,
                        minLines: 4,
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          _PromptGetInspirationButton(
                            textEditingController: _textFieldController,
                          ),
                          Row(
                            children: [
                              _PromptLengthLabel(length: _promptLength),
                              const SizedBox(width: 8),
                              _PromptResetButton(
                                  textEditingController: _textFieldController)
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 32),
                _GenerateButton(
                  textEditingController: _textFieldController,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _PromptGetInspirationButton extends StatefulWidget {
  const _PromptGetInspirationButton({
    super.key,
    required this.textEditingController,
  });

  final TextEditingController textEditingController;

  @override
  State<_PromptGetInspirationButton> createState() =>
      _PromptGetInspirationButtonState();
}

class _PromptGetInspirationButtonState
    extends State<_PromptGetInspirationButton> {
  bool _loading = false;

  Future<void> _handleGetInspiration() async {
    setState(() {
      _loading = true;
    });

    try {
      final response = await CreationsApiService.listInspirations();

      widget.textEditingController.text = response.prompt;

      FirebaseAnalytics.instance.logEvent(name: 'creations_inspirations_list');
    } catch (exception) {
      FirebaseCrashlytics.instance.recordError(exception, null);
    } finally {
      setState(() {
        _loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return GestureDetector(
      onTap: _handleGetInspiration,
      child: Row(
        children: [
          Icon(
            _loading ? Icons.downloading : Icons.lightbulb,
            size: 20,
            color: _loading ? Freud.gray60 : Freud.green50,
          ),
          const SizedBox(width: 8),
          Text(
            _loading ? 'Downloading' : 'Get inspired',
            style: textTheme.bodySmall!.copyWith(
              color: _loading ? Freud.gray60 : Freud.green50,
              fontWeight: FontWeight.w800,
            ),
          )
        ],
      ),
    );
  }
}

class _PromptLengthLabel extends StatelessWidget {
  const _PromptLengthLabel({super.key, required this.length});

  final int length;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    Color color = Freud.gray60;
    if (length > maxPromptLength) {
      color = Freud.red60;
    }

    return Text(
      '$length/$maxPromptLength',
      style: textTheme.bodySmall!.copyWith(
        color: color,
        fontWeight: FontWeight.w800,
      ),
    );
  }
}

class _PromptResetButton extends StatelessWidget {
  const _PromptResetButton({
    super.key,
    required this.textEditingController,
  });

  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        textEditingController.clear();
      },
      child: const Icon(
        Icons.clear,
        size: 20,
        color: Freud.gray60,
      ),
    );
  }
}

class _GenerateButton extends StatefulWidget {
  const _GenerateButton({
    super.key,
    required this.textEditingController,
  });

  final TextEditingController textEditingController;

  @override
  State<_GenerateButton> createState() => _GenerateButtonState();
}

class _GenerateButtonState extends State<_GenerateButton> {
  bool _loading = false;

  Future<void> _handleGenerate(BuildContext context) async {
    setState(() {
      _loading = true;
    });

    try {
      final prompt = widget.textEditingController.text;

      final response = await CreationsApiService.storeCreation(prompt);

      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (ctx) => CreationDetailScreen(
            items: response.items,
          ),
        ),
      );
    } catch (exception) {
      FirebaseCrashlytics.instance.recordError(exception, null);
    } finally {
      setState(() {
        _loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return GestureDetector(
      onTap: () {
        _handleGenerate(context);
      },
      child: Container(
        width: double.infinity,
        height: 64,
        decoration: BoxDecoration(
          color: _loading ? Freud.brown90 : Freud.brown60,
          borderRadius: BorderRadius.circular(64),
        ),
        child: Center(
          child: Text(
            'Generating',
            style: textTheme.titleSmall!.copyWith(
              color: _loading ? Freud.gray60 : Colors.white,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
      ),
    );
  }
}
