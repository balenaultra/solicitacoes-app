import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:solicitacoes_app/api/request_api.dart';
import 'package:solicitacoes_app/api/stream_api.dart';
import 'package:solicitacoes_app/datas/request_data.dart';

import 'package:solicitacoes_app/models/requests_model.dart';
import 'package:solicitacoes_app/utils.dart';
import 'package:solicitacoes_app/utils/api_response.dart';
import 'package:solicitacoes_app/widgets/app_button.dart';
import 'package:solicitacoes_app/widgets/card.dart';
import 'package:solicitacoes_app/widgets/text_error.dart';
import 'package:table_calendar/table_calendar.dart';

class RequestsQueryPage extends StatefulWidget {
  @override
  _RequestsQueryPageState createState() => _RequestsQueryPageState();
}

class _RequestsQueryPageState extends State<RequestsQueryPage> {
  final _model = RequestsModel();

  CalendarFormat _calendarFormat = CalendarFormat.week;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  void initState() {
    _model.fetch(date: _selectedDay);
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        List<Request>? requests = _model.requestList;

        if (_model.error != null) {
          print("modal error>> " + _model.error.toString());
          return Container(
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextError(_model.error.toString()),
              ],
            ),
          );
        }

        if (requests == null) {
          return Container(
            child: CircularProgressIndicator(),
          );
        }

        print(requests.length);
        return Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                TableCalendar(
                  firstDay: kFirstDay,
                  lastDay: kLastDay,
                  focusedDay: _focusedDay,
                  availableCalendarFormats: {
                    CalendarFormat.week: 'Semana',
                    CalendarFormat.month: 'Mês',
                  },
                  calendarFormat: _calendarFormat,
                  selectedDayPredicate: (day) {
                    return isSameDay(_selectedDay, day);
                  },
                  onDaySelected: (selectedDay, focusedDay) {
                    if (!isSameDay(_selectedDay, selectedDay)) {
                      setState(() {
                        _selectedDay = selectedDay;
                        _focusedDay = focusedDay;
                        _model.fetch(date: _selectedDay);
                      });
                    }
                  },
                  onFormatChanged: (format) {
                    if (_calendarFormat != format) {
                      setState(() {
                        _calendarFormat = format;
                      });
                    }
                  },
                  onPageChanged: (focusedDay) {
                    _focusedDay = focusedDay;
                  },
                ),
                ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: requests != null ? requests.length : 0,
                  itemBuilder: (context, index) {
                    Request request = requests[index];
                    return RequestCard(request);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
