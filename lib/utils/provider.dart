import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sundar_gutka/data/model.dart';
import 'package:sundar_gutka/utils/dbms.dart';

final settingsProvider = StateNotifierProvider<SettingsNotifier, SettingModel>(
  (ref) => SettingsNotifier(),
);

class SettingsNotifier extends StateNotifier<SettingModel> {
  final SharedPrefsHelper _prefsHelper = SharedPrefsHelper();

  SettingsNotifier() : super(SettingModel(
            fontSize: 26,
            fontWeight: FontWeight.normal.value ~/ 100,
            isPageView: true,
            language: Language.punjabi)) {
    _loadInitialSettings();
  }

  Future<void> _loadInitialSettings() async {
    state = await _prefsHelper.loadSettings();
  }

  Future<void> updateIsPageView() async {
    state = state.copyWith(isPageView: !state.isPageView);
    await _prefsHelper.saveSettings(state);
  }

  Future<void> incFontSize() async {
    if (state.fontSize == 40) return;
    state = state.copyWith(fontSize: state.fontSize + 2);
    await _prefsHelper.saveSettings(state);
  }

  Future<void> decFontSize() async {
    if (state.fontSize == 10) return;
    state = state.copyWith(fontSize: state.fontSize - 2);
    await _prefsHelper.saveSettings(state);
  }

  Future<void> incFontWeight() async {
    if (state.fontWeight == 8) return;
    state = state.copyWith(fontWeight: state.fontWeight + 1);
    await _prefsHelper.saveSettings(state);
  }

  Future<void> decFontWeight() async {
    if (state.fontWeight == 1) return;
    state = state.copyWith(fontWeight: state.fontWeight - 1);
    await _prefsHelper.saveSettings(state);
  }

  Future<void> updateLanguage(Language value) async {
    state = state.copyWith(language: value);
    await _prefsHelper.saveSettings(state);
  }
}


final pageIndexProvider = StateNotifierProvider<PageIndexNotifier, Map<String, int>>(
    (ref) => PageIndexNotifier());

class PageIndexNotifier extends StateNotifier<Map<String, int>> {
  PageIndexNotifier() : super({});

  void updateIndex(String pathName, int index) {
    // Create a copy of the current state and modify it
    final newState = Map<String, int>.from(state);
    // Update the index if key is present or add the key-value pair
    newState[pathName] = index;
    // Update the state with the modified map
    state = newState;
  }
}
