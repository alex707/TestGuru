document.addEventListener('turbolinks:load', function() {
  var field = document.getElementById('countdown_timer');

  if (field) {
    var countDownDate = new Date(Number(field.innerHTML)).getTime();
    setInterval(changeValue, 1000, countDownDate);
  }
});

function changeValue(countDownDate) {
  var now = new Date().getTime();
  var distance = countDownDate - now;
  var minutes = Math.floor(distance / (1000 * 60));
  var seconds = Math.floor((distance % (1000 * 60)) / 1000);

  document.getElementById("countdown_timer").innerHTML = minutes + "m " + seconds + "s";
  document.getElementById("countdown_timer").classList.remove('hide');

  if (distance <= 0) {
    var form = document.querySelector('.survey-form');
    var surveyId = form.dataset.surveyId;

    document.querySelector('.survey-form[data-survey-id="' + surveyId + '"]').submit();
    document.getElementById("countdown_timer").classList.add('hide');
  }
}
