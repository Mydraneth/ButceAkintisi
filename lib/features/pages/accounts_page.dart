import 'package:butceakintisi/core/components/account_card.dart';
import 'package:butceakintisi/core/utils/dummy_accounts.dart';
import 'package:butceakintisi/core/utils/radial_bg.dart';
import 'package:flutter/material.dart';

class AccountsPage extends StatelessWidget {
  const AccountsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return RadialBackground(
      child: SafeArea(
        top: true,
        bottom: true,
        child: ShaderMask(
          shaderCallback: (Rect bounds) {
            return LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.transparent,
                Colors.transparent,
                Colors.black.withAlpha(200),
              ],
              stops: const [0.0, 0.9, 1.0],
            ).createShader(bounds);
          },
          blendMode: BlendMode.dstOut,
          child: Scrollbar(
            thumbVisibility: true,
            thickness: 6,
            radius: const Radius.circular(10),
            interactive: true,
            child: ListView.builder(
              padding: const EdgeInsets.only(top: 20, bottom: 20),
              itemCount: dummyAccounts.length,
              itemBuilder: (context, index) {
                return AccountCard(account: dummyAccounts[index]);
              },
            ),
          ),
        ),
      ),
    );
  }
}
