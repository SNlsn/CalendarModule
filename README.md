# Calendar Module Development

This project is a test. My objective is to work out issues related to the event creation and display aspects of a larger scheduling and client management app I'm developing for my small photo business.

A previous version used the [bokmann fullcalendar-assets gem](https://github.com/bokmann/fullcalendar_assets), but I later decided to avoid that since I don't know if bokmann's gem will continue to be updated when Adam Shaw's wonderful [FullCalendar jQuery project](http://arshaw.com/fullcalendar/) gets updated. I'd rather give up some convenience in exchange for knowing I can update FullCalendar. For that reason, Shaw's jQuery code and css have been added directly to the assets directories, rather than using David Bock's asset gem, convenient as that was. However, much of what makes this project work is thanks to David's example app.

I'm dissatisfied with the datetime pickers currently available. The jQueryUI datepicker is awesome but it lacks a 12 hour time input. I'm leaning toward just a simple text field, parsed via the Chronic gem. I'm grateful to Ryan Bates for many reasons but specifically for his [RailsCasts episode on Virtual Attributes](http://railscasts.com/episodes/16-virtual-attributes-revised) that was my inspiration for how a text entry field (in partnership with the Chronic gem) could be used for very easy and intuitive datetime input. Although the user base for this app is currently exclusively the four staff members of my business, it still needs to be obvious, intuitive and fast because we are generally creating an assignment record while on the phone with the client.

The "sequence" text doc in the "notes" directory pretty much spells out the sequential recipe for developing this project. I can't imagine anyone but me being interested in this project but, if you are, you're welcome to browse.