import 'package:flutter/material.dart';
import 'package:flutter_one/note_app/provider/note_provider.dart';
import 'package:flutter_one/responsive_ui/size_config.dart';
import 'package:provider/provider.dart';

class NoteDetail extends StatefulWidget {
  const NoteDetail(
      {Key? key, this.noteTitle, this.noteDescription, required this.title})
      : super(key: key);
  final String? noteTitle;
  final String? noteDescription;
  final String title;

  @override
  _NoteDetailState createState() => _NoteDetailState();
}

class _NoteDetailState extends State<NoteDetail> {
  final _textTitleController = TextEditingController();
  final _textDescriptionController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _textTitleController.dispose();
    _textDescriptionController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final setNoteDetail = Provider.of<NoteProvider>(context);
    if (widget.noteDescription != null) {
      _textDescriptionController.text = widget.noteDescription!;
    }

    if (widget.noteTitle != null) {
      _textTitleController.text = widget.noteTitle!;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 1.5 * SizeConfig.heightMultiplier!,
          horizontal: 5 * SizeConfig.widthMultiplier!,
        ),
        child: Column(
          children: [
            TextField(
              controller: _textTitleController,
              decoration: const InputDecoration(
                labelText: 'Title',
                hintText: 'Title',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 2 * SizeConfig.heightMultiplier!),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Description',
                border: OutlineInputBorder(),
                hintText: 'Enter your description for your note here..',
              ),
              maxLines: 5,
              controller: _textDescriptionController,
            ),
            ElevatedButton(
              onPressed: () {
                final textTitle = _textTitleController.text;
                final textDescription = _textDescriptionController.text;
                setNoteDetail.setNoteData(textTitle, textDescription);
                Navigator.of(context).pop();
              },
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
