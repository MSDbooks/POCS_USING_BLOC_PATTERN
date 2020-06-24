import 'package:newcursoflutter/modules/conversor/providers/conversorProvider.dart';

class ConversorRepository {

 final _provider = ConversorProvider();

 Future<Map<String, dynamic>> getIbovespaData() async {
   return _provider.getIbovespaData();
 }



}