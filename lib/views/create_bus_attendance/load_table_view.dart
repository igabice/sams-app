import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sc_app/model/bus_users.dart';
import 'package:sc_app/model/user.dart';
import 'package:sc_app/styles/styles.dart';
import 'package:sc_app/views/driver/route_detail/StateNotifier.dart';

class LoadTable extends StatefulWidget {

  final int id;
  
  LoadTable({Key key, @required this.id}) : super(key: key);
  
  @override
  _LoadTableState createState()  => new _LoadTableState(id);
}
   
  class _LoadTableState extends State<LoadTable>{

    int id;
    _LoadTableState(this.id);
  

  List<busUsers> _users = [];
  List<busUsers> _selectedUsers = [];
  bool sort;

  onSortColum(int columnIndex, bool ascending) {
    if (columnIndex == 0) {
      if (ascending) {
        _users.sort((a, b) => a.student.getFullName().compareTo(b.student.getFullName()));
      } else {
       _users.sort((a, b) => b.student.getFullName().compareTo(a.student.getFullName()));
      }
    }
  }
  
  
  @override
  Widget build(BuildContext context) {

    final state = Provider.of<RouteDetailNotifier>(context);
    _users = state.getUsers;
    _selectedUsers = state.getSelectedUsers;
    sort = state.isSorted;
    
    if(state.isFetching){
      state.updateUsers(id);
    }

    return Container(
      padding: const EdgeInsets.all(16.0),
      child:
    state.isFetching ?
      Center(child: CircularProgressIndicator(),) :
        SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: DataTable(
            sortAscending: sort,
            sortColumnIndex: 0,
                columns: [
                  DataColumn(
              label: Text("FIRST NAME"),
              numeric: false,
              tooltip: "This is First Name",
              onSort: (columnIndex, ascending) {
                  state.setSorted(!state.isSorted);
                onSortColum(columnIndex, ascending);
              }),
                ],
                rows: _users.map(
                  (user) =>  DataRow(
                          selected: _selectedUsers.contains(user),
                          onSelectChanged: (b) { print("Onselect"); 
                          if (b) {
                            state.addSelectedUsers(user);
                          } else {
                            state.removeSelectedUsers(user);
                          }
                          //onSelectedRow(b, user); 
                          },
                          cells: [
                          DataCell(
                              Text(user.student.getFullName()),
                              onTap: () {
                              print('Selected ${user.student.getFullName()}');
                              },
                          ),
                          ]),
              )
              .toList(),
        ),
        )
    );
     
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return null;
  }

  
}