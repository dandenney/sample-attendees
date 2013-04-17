$ ->

  # Required inclusion for interacting with Firebase
    usersRef = new Firebase("https://sample-attendees.firebaseio.com/attendees/")
    
  # Listen for a child to be added, then do this
    usersRef.on "child_added", (snapshot) ->
      firstName = snapshot.val().firstName
      lastName = snapshot.val().lastName
      workTitle = snapshot.val().workTitle
      companyName = snapshot.val().companyName
      twitterName = snapshot.val().twitterName
      githubName = snapshot.val().githubName
      dribbbleName = snapshot.val().dribbbleName
      codepenName = snapshot.val().codepenName
      websiteURL = snapshot.val().websiteURL
      $("#fb-people").append "<li>" + firstName + "&nbsp;" + lastName + "<div class='workTitle'>" + workTitle + "</div>" + "<div class='companyName'>" + companyName + "</div>" + "<ul class='attendeeLinks'>" + "<li>" + "<a class='twitterName' href='http://twitter.com/" + twitterName + "'>" + "&#64;" + twitterName + "</a>" + "</li>" + "<li>" + "<a class='githubName' href='http://github.com/" + githubName + "'>" + "Github" + "</a>" + "</li>" + "<li>" + "<a class='dribbbleName' href='http://dribbble.com/" + dribbbleName + "'>" + "Dribbble" + "</a>" + "</li>" + "<li>" + "<a class='codepenName' href='http://codepen.io/" + codepenName + "'>" + "CodePen" + "</a>" + "</li>" + "<li>" + "<a class='websiteURL' href='http://" + websiteURL + "'>" + websiteURL + "</a>" + "</li>" + "</ul>" + "</li>"
      $("#fb-admin").append "<li>" + firstName + lastName + workTitle + companyName + twitterName + githubName + dribbbleName + codepenName + websiteURL + "</li>"
  
  # Sending data on click
    $("#profileSubmit").click ->
      
      # Required inclusion to interact with Firebase
      messageListRef = new Firebase("https://sample-attendees.firebaseio.com/attendees/")
      
      # Assigning form values to variables
      submitFirstName = $("#firstName").val()
      submitLastName = $("#lastName").val()
      submitWorkTitle = $("#workTitle").val()
      submitCompanyName = $("#companyName").val()
      submitTwitterName = $("#twitterName").val()
      submitGithubName = $("#githubName").val()
      submitDribbbleName = $("#dribbbleName").val()
      submitCodepenName = $("#codepenName").val()
      submitWebsiteURL = $("#websiteURL").val()
      
      # List of data to be sent to Firebase as a single object
      messageListRef.push
        firstName: (submitFirstName)
        lastName: (submitLastName)
        workTitle: (submitWorkTitle)
        companyName: (submitCompanyName)
        twitterName: (submitTwitterName)
        githubName: (submitGithubName)
        dribbbleName: (submitDribbbleName)
        codepenName: (submitCodepenName)
        websiteURL: (submitWebsiteURL)