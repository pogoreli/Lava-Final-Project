void LeaderBoardRec()//call this function after the last question
{
  TableRow newRow=table.addRow();
  newRow.setInt(0,userID);
  newRow.setString(1,username);
  newRow.setInt(2,score);
}
