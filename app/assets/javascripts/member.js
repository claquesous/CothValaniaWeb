function getSelected(opt) {
  var selected = new Array();
  var index = 0;
  for (var i = 0; i < opt.length; i++) {
    if ((opt[i].selected) || (opt[i].checked)) {
      index = selected.length;
      selected[index] = new Object;
      selected[index].value = opt[i].value;
      selected[index].index = i;
      selected[index].text = opt[i].text;
    }
  }
  return selected;
}

function removeSelectedItems(opt) {
  for (var i = opt.length-1; i >= 0; i--) {
    if ((opt[i].selected)) {
      opt.remove(i);
    }
  }
}

function setValues(){
  var opt = $('#preferences')[0];
  var values = "";
  for (var i=0; i < opt.length; i++){
    values += opt[i].value + " ";
  }
  var rp =  $('#reward_preferences')[0].value = values;
}

function addSelected() {
  var opt = $('#reward_list')[0];
  var add = $('#preferences')[0];
  var sel = getSelected(opt);
  for (var item in sel){ 
    add[add.length] = new Option(sel[item].text, sel[item].value, false);
//    document.reward_prefs.adder.disabled=false;
  }
  removeSelectedItems(opt);
  setValues();
}

function removeSelected() {
  var opt = $('#preferences')[0];
  var rem = $('#reward_list')[0]; 
  var sel = getSelected(opt);
  for (var item in sel){
    rem[rem.length] = new Option(sel[item].text, sel[item].value, false);
  //  document.reward_prefs.adder.disabled=false;
  }
  removeSelectedItems(opt);
  setValues();
}

function upSelected(){
  var opt = $('#preferences')[0];
  for (var i = 1; i< opt.options.length; i++){
    if (opt[i].selected){
      var swap = new Option(opt[i-1].text, opt[i-1].value, opt[i-1].selected);
      opt[i-1] = new Option(opt[i].text, opt[i].value,opt[i].selected);
      opt[i] = swap;
    //  document.reward_prefs.adder.disabled=false;
    }
  }
  setValues();
}

function downSelected(){
  var opt = $('#preferences')[0];
  for (var i = opt.length-1; i>=0; i--){
    if (opt[i].selected){
      var swap = new Option(opt[i+1].text, opt[i+1].value, opt[i+1].selected);
      opt[i+1] = new Option(opt[i].text, opt[i].value,opt[i].selected);
      opt[i] = swap;
//      document.reward_prefs.adder.disabled=false;
    }
  }
  setValues();
}

