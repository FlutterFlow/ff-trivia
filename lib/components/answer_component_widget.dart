import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AnswerComponentWidget extends StatefulWidget {
  const AnswerComponentWidget({
    Key key,
    this.answer,
  }) : super(key: key);

  final String answer;

  @override
  _AnswerComponentWidgetState createState() => _AnswerComponentWidgetState();
}

class _AnswerComponentWidgetState extends State<AnswerComponentWidget> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0, 0),
      child: Text(
        widget.answer,
        style: FlutterFlowTheme.title2,
      ),
    );
  }
}
