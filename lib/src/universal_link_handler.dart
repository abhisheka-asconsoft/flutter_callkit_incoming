part of './../flutter_callkit_incoming.dart';

class UniversalLinkHandler {
  static const EventChannel _eventChannel = const EventChannel('universal_link_event');

  static Stream<UniversalLinkEvent?> get onEvent =>
      _eventChannel.receiveBroadcastStream().map(_receiveUniversalLinkEvent);

  static UniversalLinkEvent? _receiveUniversalLinkEvent(dynamic data) {
    String link = "";
    if (data is Map) {
      link = data['link'];
    }
    return UniversalLinkEvent(link);
  }
}

class UniversalLinkEvent {
  String link;

  UniversalLinkEvent(this.link);

  @override
  String toString() {
    return "{ UniversalLinkEvent: ${this.toString()}}";
  }
}