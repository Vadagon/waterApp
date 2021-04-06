num waterCalculator([user, cb]) {
  print('waterCalculator');

  var dynamicNum = double.parse(user['weight']);

  if (double.parse(user['age']) < 30)
    dynamicNum = dynamicNum * 40;
  else if (double.parse(user['age']) <= 55)
    dynamicNum = dynamicNum * 35;
  else if (double.parse(user['age']) > 55) dynamicNum = dynamicNum * 30;

  // ounches
  dynamicNum = dynamicNum / 28.3;
  // ml
  dynamicNum = dynamicNum * 29.5735;
  print(dynamicNum);
  // // litres
  // dynamicNum = dynamicNum / 1000;

  var minutesOfWorkout = 20;
  // if(user['activity'] === 'SEDENTARY')
  if (user['activity'] == 'NORMAL') minutesOfWorkout = 20;
  if (user['activity'] == 'ACTIVE') minutesOfWorkout = 40;
  if (user['activity'] == 'VERY ACTIVE') minutesOfWorkout = 80;

  // ml for every 10 minutes
  var extraMl = 4 * 29.5735;

  dynamicNum = dynamicNum + minutesOfWorkout / 10 * extraMl;

  return dynamicNum.round();
}
