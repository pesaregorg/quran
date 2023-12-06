import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:quran/models/quran_aya.dart';

class QuranPlayerController extends ChangeNotifier{



  QuranPlayerController(this._ayas){
    _init();
  }


  final List<QuranAya> _ayas;
  List<GlobalKey> _keys = [];
  final AudioPlayer _audioPlayer = AudioPlayer();
  PlayerState _playerState = PlayerState.stopped;
  int _selectedPlayerIdx = 0;
  List<GlobalKey> get getKeys => _keys;

  AudioPlayer get getAudioPlayer => _audioPlayer;
  int get getSelectedPlayerIdx => _selectedPlayerIdx;
  PlayerState get getPlayerState => _playerState;



  _init(){
    _keys = [];
    for(var item in _ayas){
      _keys.add(GlobalKey());
    }
    notifyListeners();

    _audioPlayer.onPlayerComplete.listen((_) {
      if (_selectedPlayerIdx < _ayas.length) {
        startPlayer();
      }
    });


    _audioPlayer.onPlayerStateChanged.listen((state) {
      _playerState = state;
      notifyListeners();
    });


  }




  startPlayer(){
    if(_ayas.isNotEmpty){
      _audioPlayer.play(UrlSource("https://everyayah.com/data/Parhizgar_48kbps/${_ayas[_selectedPlayerIdx].audio}.mp3"));
      scrollToItem();
      _selectedPlayerIdx++;
      notifyListeners();
    }
  }


  resumePlayer(){
    _audioPlayer.resume();
    notifyListeners();
  }


  pausePlayer(){
    _audioPlayer.pause();
    notifyListeners();
  }


  GlobalKey getItemKey(int ayaId){
    int index = _ayas.indexWhere((element) => element.id == ayaId);
    return _keys[index];
  }



  Future scrollToItem () async{
    final context = _keys[_selectedPlayerIdx].currentContext!;
    await Scrollable.ensureVisible(context);
  }





  @override
  void dispose() async{
    _audioPlayer.stop();
    await Future.delayed(const Duration(milliseconds: 50));
    super.dispose();
  }


}