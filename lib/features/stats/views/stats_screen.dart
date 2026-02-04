import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StatsScreenV2 extends StatelessWidget {
  const StatsScreenV2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              SizedBox(height: 15),
              WalletDetailsAppBar(),
              SizedBox(height: 15),
              WalletDetails(),
              SizedBox(height: 15),
              BalanceChart(),
              BalanceAvailableSummary(),
              SizedBox(height: 15),
              ListOfLinkedAccounts(),
            ],
          ),
        ),
      ),
    );
  }
}

class WalletDetailsAppBar extends StatelessWidget {
  const WalletDetailsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(icon: Icon(Icons.arrow_back), onPressed: () {}),
        Text(
          'Wallet Details',
          style: GoogleFonts.manrope(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        IconButton(icon: Icon(Icons.more_horiz), onPressed: () {}),
      ],
    );
  }
}

class WalletDetails extends StatelessWidget {
  const WalletDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 15),
        Text(
          'TOTALBALANCE',
          style: GoogleFonts.manrope(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.grey),
        ),

        Text('\$12,450.80', style: GoogleFonts.manrope(fontSize: 42, fontWeight: FontWeight.w900)),
        // SizedBox(height: 15),
        Container(
          height: 40,
          width: 200,
          padding: EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: Color(0xffecfdf5),
            border: Border.all(color: Color(0xffd1fae5)),
            borderRadius: BorderRadius.circular(18),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.show_chart_rounded, color: Colors.green),
              Text(
                '+2.0% vs last month',
                style: GoogleFonts.manrope(
                  fontSize: 12,
                  fontWeight: FontWeight.w900,
                  color: Colors.green[700],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class BalanceChart extends StatefulWidget {
  const BalanceChart({super.key});

  @override
  State<BalanceChart> createState() => _BalanceChartState();
}

enum Period { threeDays, week, month, quarter }

class _BalanceChartState extends State<BalanceChart> {
  final List<Color> gradientColors = [Color(0x228b5ce6), Color(0x008b5ce6)];
  var _selectedChartPeriod = Period.threeDays;

  final Map<Period, Widget> _periods = <Period, Widget>{
    Period.threeDays: Center(child: Text('3D')),
    Period.week: SizedBox(height: 30, child: Center(child: Text('1W'))),
    Period.month: SizedBox(height: 30, child: Center(child: Text('1M'))),
    Period.quarter: SizedBox(height: 30, child: Center(child: Text('3M'))),
  };

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(color: Colors.black.withAlpha(10), blurRadius: 10, offset: Offset(0, 5)),
        ],
      ),
      child: Stack(
        children: [
          Positioned.fill(
            child: AspectRatio(
              aspectRatio: 1.70,
              child: Padding(
                padding: const EdgeInsets.only(right: 18, left: 12, top: 18, bottom: 12),
                child: LineChart(mainData()),
              ),
            ),
          ),

          SizedBox(
            width: 250,
            child: CupertinoSlidingSegmentedControl<Period>(
              // backgroundColor: Colors.grey[200]!,
              children: _periods,
              groupValue: _selectedChartPeriod,
              onValueChanged: (value) {
                if (value != null) {
                  setState(() => _selectedChartPeriod = value);
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(color: Colors.grey, fontSize: 8, fontWeight: FontWeight.bold);
    String text = switch (value.toInt()) {
      1 => '01 Sep',
      3 => '08 Sep',
      5 => '15 Sep',
      7 => '22 Sep',
      9 => '29 Sep',

      _ => '',
    };
    return SideTitleWidget(
      meta: meta,
      child: Text(text, style: style),
    );
  }

  LineChartData mainData() {
    return LineChartData(
      gridData: FlGridData(show: false),
      showingTooltipIndicators: [],
      titlesData: FlTitlesData(
        show: true,
        rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
        leftTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
        topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            interval: 1,
            getTitlesWidget: bottomTitleWidgets,
          ),
        ),
      ),
      borderData: FlBorderData(show: false),
      minX: 0,
      maxX: 11,
      minY: 0,
      maxY: 6,
      lineBarsData: [
        LineChartBarData(
          spots: const [
            FlSpot(0, 3),
            FlSpot(2.6, 2),
            FlSpot(4.9, 3),
            FlSpot(6.8, 3.1),
            FlSpot(8, 4),
            FlSpot(9.5, 3.5),
            FlSpot(11, 5),
          ],
          color: Color(0xff8b5ce6),
          isCurved: true,
          barWidth: 3,
          isStrokeCapRound: true,
          dotData: const FlDotData(show: false),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              begin: Alignment.center,
              end: Alignment.bottomCenter,
              colors: gradientColors,
            ),
          ),
        ),
      ],
    );
  }
}

class BalanceAvailableSummary extends StatelessWidget {
  const BalanceAvailableSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            height: 150,
            width: 190,
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundColor: Color(0xffd1fae5),
                  child: Icon(Icons.account_balance_wallet_outlined, color: Color(0xff059669)),
                ),
                SizedBox(height: 8),
                Text(
                  'AVAILABLE BALANCE',
                  style: GoogleFonts.manrope(
                    color: Colors.grey,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  '\$8,250.00',
                  style: GoogleFonts.manrope(fontSize: 22, fontWeight: FontWeight.w900),
                ),
              ],
            ),
          ),
          Container(
            height: 150,
            width: 190,
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundColor: Color(0xffffe4e6),
                  child: Icon(Icons.account_balance_wallet_outlined, color: Color(0xffe11d48)),
                ),
                SizedBox(height: 8),
                Text(
                  'TOTAL LIABILITIES',
                  style: GoogleFonts.manrope(
                    color: Colors.grey,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  '\$4,200.00',
                  style: GoogleFonts.manrope(fontSize: 22, fontWeight: FontWeight.w900),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ListOfLinkedAccounts extends StatelessWidget {
  const ListOfLinkedAccounts({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Linked Accounts',
              style: GoogleFonts.manrope(fontSize: 16, fontWeight: FontWeight.w900),
            ),
            IconButton(icon: Icon(Icons.add), onPressed: () {}),
          ],
        ),
        ListView.separated(
          shrinkWrap: true,
          itemCount: 3,
          separatorBuilder: (_, _) => SizedBox(height: 8),
          itemBuilder: (context, index) {
            return ListTile(
              contentPadding: EdgeInsets.all(12),
              tileColor: Colors.white,
              shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(14.0),
              ),
              leading: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  color: Color(0xff11118f),
                ),
                child: Icon(Icons.account_balance_outlined, color: Color(0xffffffff)),
              ),
              title: Text(
                'Account Name',
                style: GoogleFonts.manrope(fontSize: 16, fontWeight: FontWeight.w900),
              ),
              subtitle: Text(
                'Account Type',
                style: GoogleFonts.manrope(fontSize: 14, fontWeight: FontWeight.w500),
              ),
              trailing: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('\$5,4500.00'),
                  Text(
                    'Active',
                    style: GoogleFonts.manrope(color: Colors.green, fontWeight: FontWeight.w900),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
