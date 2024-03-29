import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class TestDraggableWidget extends StatefulWidget {
  static const String routeName = '/';

  const TestDraggableWidget({Key? key}) : super(key: key);

  @override
  State<TestDraggableWidget> createState() => _TestDraggableWidgetState();
}

class _TestDraggableWidgetState extends State<TestDraggableWidget> {
  String _color = 'Drag me';

  bool _isDropped = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Draggable<String>(
                // Data is the value this Draggable stores.
                data: _color,
                child: Container(
                  height: 150.0,
                  width: 150.0,
                  color: Colors.redAccent,
                  child: const Center(
                    child: Text(
                      'Drag me',
                      textScaleFactor: 2,
                    ),
                  ),
                ),
                feedback: Material(
                  child: Container(
                    height: 170.0,
                    width: 170.0,
                    decoration: BoxDecoration(
                      color: Colors.redAccent,
                    ),
                    child: const Center(
                      child: Text(
                        'Dragging',
                        textScaleFactor: 2,
                      ),
                    ),
                  ),
                ),
                childWhenDragging: Container(
                  height: 150.0,
                  width: 150.0,
                  color: Colors.grey,
                  child: const Center(
                    child: Text(
                      'I was here',
                      textScaleFactor: 2,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.15,
              ),
              DragTarget<String>(
                builder: (
                  BuildContext context,
                  List<dynamic> accepted,
                  List<dynamic> rejected,
                ) {
                  return DottedBorder(
                    borderType: BorderType.RRect,
                    radius: Radius.circular(12),
                    padding: EdgeInsets.all(6),
                    color: Colors.white,
                    strokeWidth: 2,
                    dashPattern: [8],
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      child: Container(
                        height: 200,
                        width: 200,
                        color: _isDropped ? Colors.redAccent : null,
                        child: Center(
                            child: Text(
                          !_isDropped ? 'Drop here' : 'Dropped',
                          textScaleFactor: 2,
                        )),
                      ),
                    ),
                  );
                },
                onAccept: (data) {
                  debugPrint('hi $data');
                  setState(() {
                    // showSnackBarGlobal(context, 'Dropped successfully!');
                    _isDropped = true;
                  });
                },
                onWillAccept: (data) {
                  return data == _color;
                },
                onLeave: (data) {
                  // showSnackBarGlobal(context, 'Missed');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
