import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mobilev2/src/core/constants.dart';
import 'package:mobilev2/src/presentation/views/widgets/overview_card.dart';

class OverviewPage extends StatelessWidget {
  const OverviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(50),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  flex: 4,
                  child: OverviewCard(
                    label: "Employees",
                    value: "1200",
                    icon: FontAwesomeIcons.building,
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: OverviewCard(
                    label: "Cost",
                    value: "${currencyPH}100,000",
                    icon: FontAwesomeIcons.chartLine,
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: OverviewCard(
                    label: "Production",
                    value: "500",
                    icon: FontAwesomeIcons.recycle,
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: OverviewCard(
                    label: "Revenue",
                    value: "${currencyPH}200,000",
                    icon: FontAwesomeIcons.moneyBillTrendUp,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
