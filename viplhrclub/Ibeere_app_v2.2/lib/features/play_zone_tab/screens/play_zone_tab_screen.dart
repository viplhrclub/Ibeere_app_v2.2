import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterquiz/commons/commons.dart';
import 'package:flutterquiz/core/core.dart';
import 'package:flutterquiz/features/auth/cubits/auth_cubit.dart';
import 'package:flutterquiz/features/quiz/models/quiz_type.dart';
import 'package:flutterquiz/features/system_config/cubits/system_config_cubit.dart';
import 'package:flutterquiz/ui/widgets/all.dart';

final class PlayZoneTabScreen extends StatefulWidget {
  const PlayZoneTabScreen({super.key});

  @override
  State<PlayZoneTabScreen> createState() => PlayZoneTabScreenState();
}

final class PlayZoneTabScreenState extends State<PlayZoneTabScreen>
    with AutomaticKeepAliveClientMixin, TickerProviderStateMixin {
  final _scrollController = ScrollController();

  final _playZones = <Zone>[];
  final List<AnimationController> _controllers = [];
  final List<Animation<double>> _scaleAnimations = [];
  final List<Animation<double>> _opacityAnimations = [];

  @override
  void initState() {
    super.initState();
    _initializePlayZones();
    _initializeAnimations();
  }

  void _initializeAnimations() {
    const animDuration = Duration(milliseconds: 350);
    const staggerDelay = 60;

    for (var i = 0; i < _playZones.length; i++) {
      final controller = AnimationController(
        duration: animDuration,
        vsync: this,
      );
      final curve = CurvedAnimation(
        parent: controller,
        curve: Curves.easeOutBack,
      );

      _controllers.add(controller);
      _scaleAnimations.add(Tween<double>(begin: .7, end: 1).animate(curve));
      _opacityAnimations.add(Tween<double>(begin: 0, end: 1).animate(curve));

      Future.delayed(
        Duration(milliseconds: staggerDelay * i),
        controller.forward,
      );
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    for (final controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void onTapTab() {
    if (_scrollController.hasClients && _scrollController.offset != 0) {
      _scrollController.animateTo(
        0,
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
      );
    }
  }
