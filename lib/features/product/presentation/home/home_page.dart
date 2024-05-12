import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gromuse/common/widgets/widgets.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const CustomScrollView(
          slivers: [
            _AppBar(),
            _Body(),
          ],
        ),
        Align(
          alignment: Alignment.topCenter,
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 0).r,
              child: Row(
                children: [
                  const GSearchBox(),
                  8.horizontalSpace,
                  const CartButton(),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _AppBar extends StatelessWidget {
  const _AppBar();

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return SliverAppBar(
      expandedHeight: 0.25.sh,
      collapsedHeight: 0.05.sh,
      toolbarHeight: 0.05.sh,
      pinned: true,
      floating: false,
      backgroundColor: Colors.transparent,
      foregroundColor: colors.onPrimary,
      flexibleSpace: SizedBox(
        height: double.infinity,
        width: 1.sw,
        child: CustomPaint(
          painter: GPrimaryPainter(colors.primary),
          child: const GLocationWidget(),
        ),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate([
        const Text('Home'),
        20.verticalSpace,
        TextButton.icon(
          icon: const Icon(PhosphorIconsBold.signOut),
          onPressed: () {},
          label: const Text('Sign Out'),
        ),
        20.verticalSpace,
      ]),
    );
  }
}

