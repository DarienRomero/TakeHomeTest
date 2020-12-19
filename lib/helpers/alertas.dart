part of 'helpers.dart';


mostrarLoading( BuildContext context ) {

  showDialog(
    context: context,
    barrierDismissible: false,
    builder: ( _ ) => AlertDialog(
      title: Text('Espere...'),
      content: LinearProgressIndicator(),
    )
  );

}

mostrarAlerta( BuildContext context, String titulo, String mensaje, VoidCallback callback ) {

  showDialog(
    context: context,
    barrierDismissible: true,
    builder: ( _ ) => AlertDialog(
      title: Text( titulo ),
      content: Text( mensaje ),
      actions: [
        MaterialButton(
          child: Text('No'),
          onPressed: () => Navigator.of(context).pop()
        ),
        MaterialButton(
          child: Text('Si'),
          onPressed: callback
        ),
      ],
    )
  );

}