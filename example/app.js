var TiIntercom = require('ti.intercom');

var win = Titanium.UI.createWindow({
  backgroundColor: '#fff',
});

var scrollview = Ti.UI.createScrollView({
  layout: 'vertical'
})

Ti.API.info('module is => ' + TiIntercom);

// ############################## initialize

TiIntercom.initialize({
  api_key: '[YOUR API KEY]',
  app_id: '[YOU APP ID]'
});

// ############################## begin/end session

var session = Ti.UI.createTextField({
  borderStyle: Ti.UI.INPUT_BORDERSTYLE_ROUNDED,
  top: 20,
  value: 'admin@example.com',
  width: 300
})

var manage_session = Ti.UI.createButton({
  height: Ti.UI.SIZE,
  title: 'Start session',
  top: 10
})

manage_session.addEventListener('click',function(){
  if(TiIntercom.sessionIsActive()) {
    TiIntercom.endSession()
    manage_session.title = 'Start Session';
  } else {
    manage_session.enabled = false;
    TiIntercom.beginSessionForUserWithEmail(session.value);

    // Also available:

    // TiIntercom.beginSessionForUserWithUserId('1');

    // TiIntercom.beginSessionForUserWithUserIdandEmail({
    //   user_id: '1',
    //   email: 'name@example.com'
    // })

    // Polls session and enables manage session button
    // according to session status.

    setTimeout(function updateSessionButton() {
      if(TiIntercom.sessionIsActive()) {
        manage_session.title = 'End Session'
        manage_session.enabled = true;
      } else
        setTimeout(updateSessionButton, 1000);
    }, 1000);
  }
})

scrollview.add(session);
scrollview.add(manage_session);


// ############################## sessionIsActive

var check_session = Ti.UI.createButton({
  height: Ti.UI.SIZE,
  title: 'Check session',
  top: 20
})

check_session.addEventListener('click',function(){
  alert('Session active: '+TiIntercom.sessionIsActive());
})

scrollview.add(check_session);

// ############################## showNewMessageComposer

var composer = Ti.UI.createButton({
  height: Ti.UI.SIZE,
  title: 'Show composer',
  top: 20
})

composer.addEventListener('click',function(){
  TiIntercom.showNewMessageComposer();
})

scrollview.add(composer);

// ############################## incrementAttribute

var attribute = Ti.UI.createTextField({
  borderStyle: Ti.UI.INPUT_BORDERSTYLE_ROUNDED,
  top: 20,
  value: 'sent_support_request',
  width: 300
})

var increment_attribute = Ti.UI.createButton({
  title: 'Increment attribute',
  top: 10
})

increment_attribute.addEventListener('click',function(){
  TiIntercom.incrementAttribute(attribute.value);
})

scrollview.add(attribute);
scrollview.add(increment_attribute);

// ############################## updateAttributes

var attributes = Ti.UI.createTextArea({
  borderColor: '#bbb',
  borderRadius: 5,
  borderWidth: 2,
  top: 20,
  value: '{"increments": {"made_in_app_purchase": 1 }, "last_purchase_date": 12345678 }',
  width: 300
})

var update_attributes = Ti.UI.createButton({
  height: Ti.UI.SIZE,
  title: 'Update attributes',
  top: 10
})

update_attributes.addEventListener('click',function(){
  TiIntercom.updateAttributes(JSON.parse(attributes.value));
})

scrollview.add(attributes);
scrollview.add(update_attributes);

// ############################## updateUserName

var username = Ti.UI.createTextField({
  borderStyle: Ti.UI.INPUT_BORDERSTYLE_ROUNDED,
  top: 20,
  value: 'Full Name',
  width: 300
})

var update_username = Ti.UI.createButton({
  bottom: 20,
  height: Ti.UI.SIZE,
  title: 'Update user\'s name',
  top: 10
})

update_username.addEventListener('click',function(){
  TiIntercom.updateUserName(username.value);
})

scrollview.add(username);
scrollview.add(update_username);

// ##

win.add(scrollview);
win.open();