import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class coronaEvent extends Equatable{
  @override
  List<Object> get props => [];
}
class firstEvent extends coronaEvent{

}
class coronaState extends Equatable{
  @override
  List<Object> get props =>[];
}
class coronaLoading extends coronaState{

}
class coronaLoaded extends coronaState{
  var corona;
  coronaLoaded(this.corona);

}
class coronaBloc extends Bloc<coronaEvent,coronaState>{
  @override
  coronaState get initialState =>coronaLoading();

  @override
  Stream<coronaState> mapEventToState(coronaEvent event) async*{
   if(event is firstEvent){
    final data=await http.Client().get('https://api.covid19api.com/summary');
    final jsonDecoded123=json.decode(data.body);
    yield coronaLoaded(jsonDecoded123);

   }
  }
}