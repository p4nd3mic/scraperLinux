1) josh willis
   jmwillis

2) scraper.sh is a script that will search websites or files for any emails and phonenumbers. There are flags to indicate whether to search for emails, phonenumbers, or both, and whether to search a file or website.

3) Since webscrapers are bots that try to access sites and gather human readable data, they are dependent on the format. Instead of showing emails and phone numbers as text maybe we could show them as simple images that look text like. This should stop a webscraper. Also, we could use something like a captcha before showing a page with emails. It would stop scrapers but still be accessible to humans.

4) Try to create an algorithm that can read images that contain text like an email address and convert it to text. I think something like this is possible but would probably be fairly difficult to implement. A technique like this could also be used to break a captcha.

5) I use the stat function to calculate the last time a file has been accessed.
 'stat -c %X $FILE'. Stat will display the last time accessed and last time modified. The %X represents last time accessed. Also the X is capital because that tells stat to get the information in seconds. 
   For the current time I used the date function. 'date +%s' gives the current time in seconds. Then all that was needed was to subtract currentime with last time accessed.

6) It will return a negative number for dates before 1970 jan 1.

7) minutes hour dom(day of month) month dow(day of week) user cmd

8) echo OMG YES!!! at 06:15 on Tuesday, the 7th of May

9)No EC
