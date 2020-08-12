import 'package:event_bus/event_bus.dart';
import 'package:flutter/rendering.dart';

EventBus eventBus = new EventBus();

class ChangeLanguageEvent {
  Locale locale;
  ChangeLanguageEvent(this.locale);
}
