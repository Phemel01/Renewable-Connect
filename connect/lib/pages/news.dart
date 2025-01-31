import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewsPage extends StatefulWidget {
  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  DateTime selectedDate = DateTime.now();

  final List<Map<String, String>> topNews = [
    {"id": "1", "title": "New Solar Farm Breaks Ground in Greenville", "category": "Project Launch"},
    {"id": "2", "title": "Government Announces Increased Funding for Renewable Energy", "category": "Policy"},
    {"id": "3", "title": "Local Wind Turbine Factory Reaches Production Milestone", "category": "Industry"},
  ];

  final List<Map<String, String>> recentNews = [
    {
      "id": "1",
      "title": "Community Solar Initiative Gains Traction",
      "description": "Local residents band together to fund and benefit from shared solar installation.",
      "image": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRh_dKyeEbanQSXZpQmD6E13ZEOJlXYZ1vs4g&s",
      "date": "2023-07-15"
    },
    {
      "id": "2",
      "title": "Breakthrough in Energy Storage Technology",
      "description": "Researchers develop new battery tech that could revolutionize renewable energy storage.",
      "image": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR3tzsBIUYZAs4IPGZCUa87VPW_RhHjvJwDFA&s",
      "date": "2023-07-14"
    },
    {
      "id": "3",
      "title": "Offshore Wind Farm Project Approved",
      "description": "State regulators give green light to major offshore wind development.",
      "image": "data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAkGBxIPEBANDxIQEA8PDw8PEA8PEBAPDw8PFRUXFhURFRUYHSggGBolGxUVITEhJSkrLi4uFx8zODMsNygtLisBCgoKDg0OFQ8PGi0dHx0wLi0rLSstLSsrKy0tKystLysrLS0tKy0tLS0vLSs3MCs1LS0tLTc3LS0rKy0rLSstK//AABEIAJYBUQMBIgACEQEDEQH/xAAbAAADAAMBAQAAAAAAAAAAAAAAAQIDBAYFB//EAEcQAAIBAgIGBgYGBggHAAAAAAABAgMREiEEMUFRYXEFE4GRkqEUFSJSsfAyQsHR4fEGB3JzdMMkM2KCorKzwiMlNDVDVGP/xAAZAQEBAQEBAQAAAAAAAAAAAAAAAQIDBAX/xAAlEQEAAgIBAwQDAQEAAAAAAAAAARECEgMhMUEiMlGBE0LRkQT/2gAMAwEAAhEDEQA/APGEVYLH2nxUgVYdgJHYdh2AmwWKsOwRFh4S7BYKjCOxWEMARIXL6sOrCsdwMnVhgAxBYy4AwcGBisFjLg4MXVvcBjsKxl6t7g6t7mCmKx6/QNHBGtp0vo6NFdXfVLSZ+zTXHDnP+6jQho8m0km23ZJa29iR0X6UUfRqOjdHRtignpGkNfWrTyS7FfsaMZz2x+W8I75fDlLBYy4BYDbDFYLGXqxOAGOwWKwhYCbBYqwWAmwrF2FYCbCsXYVgJsKxdgsBjsFi7CsUTYVi7CAmwFACmxYaiZMAYDNlJUOKFgMmAfVixjwcgwF4AwlsRhHhKsAQlBlqmxXYXIqkikuRFwBbKorgUqaMNxqRKW2xGiuBfo8eBrYy1We8lS1EwzrRolejr5ZgVd7y1X5EqWrhk6hfLGqPAjr+KKWkE6tXCup4B1dhekh6STqXD3v0Q0BSrOvUyp6PHrG3qxWdn2JN9iPG6WrPSK1SvJZ1JOVnsjqjHsSS7D3Kumej9HQhqqaZKUuPUxaV+20ey5zzqyf45GMLnKcvpvKoiMftqS0fcR6OzfXFxBuPPyOmznrDSVBjjozZuRqJal5l9fwG0rGMNCWitfiY3o/I9TrFwJwxe4bSThDynQK9Gyvs7D1OqhvDqIv6w3T8bylQiOWjrYek9DjskifRV7yG5o8qVDmHUnpz0ZbJoxvRV71y7Jo810hOKN96MuY1Q4F2TV5uW4WE3ZUHsQuofEuxq08AsBt9TwYnT4DY1auADa6t7gGxTLjDGLCGEjJ4gxDjHeZcEd9uYspguIzOC3oThxQtKYrBYyOIYS2lMdgsXhKjAWUxYR4TbjZc+RXXpE2a1aVgNmpNPZYIuO7vFpq1h24GaTWxEXLZTPT6Pqyz6uSXvT/4cPFKy8zPDov3q2iw511P/TUjRbvm83vebC5nqsTD2qHRWi/+TTIL93QrzXe0jepaD0ZH6ekV58oOCf8Agb8zlwMzhM/tLcZxH6w656R0VD6NKpUfHG/JzijV0vpig1hoaPo8LprHUodZNX1NLHa643ObKijP4o8zM/bf5Z8RH+Om0XSqvSujQ0mUaT02jTl1lCliwzoqclGdNPO+Wcbv6S3pPnK1S7uexWpPo7SKVWh7OKlR0iMfq2nBKcGtsW4yy4rcje/SXQadamuk9Gj/AMOo7V4baNXa2uL82ntOfHOtRPae38dOT1XXeO/9cm2GJlWXETS3s9LzFjYsQ+0XaAXC4Pn5EsIrFxFi5k94X5gs8b4ixhclsCsYusZIgL657xdfLeQxBblT0iW8PSJb/gY7CHQuVvSJbyXpEt5LQmOhcq9Ilv8AgBADoXL2OrW8lwW8xXY7mGjdiblp8AyLaUm4F5FJrcu8WUmM7bDZpVrxndaor/NEwu27uZt6NSXU15Z5OjHvlJ/7TMzDWMS1HOPuvvJUrFxprf5GX0eL+sW4hNZlixQexolKPE2Foi97usRLRXszG0LOOXwwSS2E2Nn0Vh6K+BdoZ0n4a1gsbPor3oXoz3obQaS17BYzugyerFwayxCMuDkTYtpSBlWFJZPkyWU6P9NY2nov8FRXc5Gl+j3THo05RqLHo9ZYK9LWpReWJLevP4er+nkLS0T+Fiu5/icocuOp44iXbkmceSZhvdOdG+j1LReOjUSqUaizVSk9T5rUzzbHraDpKqU/Q6rSjicqFSWqjVetN7IS1Pc7PeedWpOEnCScZRbjKL1prWjpjlPaXPKPMMNgsXYLGrZpjsFi7CsLKRYLGWlTxNLVrbe5JXb7EmyZWu7ar5X12JZTHYVi7CsLKRYRYrC1pFhNFiFlIsKxYha0hoRQmhZSQGMWU3RiGYtvUwAYs1AwuZKFGVSShCMpyeqMU5SfYiWaosehSy0Wrx0iiufsVH5faZo9G0qKxaVVSl/69BqpV5Sl9GHmXR0vFGd6UPQoShjpRdq1OpO6hWhUkm3K0ZJpu2aVlmYyz+G8cPl44G/0h0dgiq1KSraPJ2VRK0oS9ypH6svJ7DzzcZWxONHceJ733kjLZR4nvfeFxALKAXABZQuK4ALKAADFlAVVezL9mXwAJr2Zfsy+Asp2H6wFnon7mS84nHs7L9YS/wCj/dVP9hxzOfFPoh05Y9ckbbn10Un/AFsElF7asEsov+0lq3rLWlfUsFjcucQQilHZ8WkZoaJJ6nT7a1GPxkXY1a4j0Y9D1Xq6l8tJ0d/7zJoWgYKmKt1bhTjKrKnGtSlOoofVUYybs243yyTbMznC6SwaTR6mlGD/AK2tFTmtsKWuEOcspPgo8TQM+l6RKrOVWbvOcnKT4vYuBgLEpMEKxQi2UmwmihCyktEtFisLKRYVi7CaFlIaJZbJFrSRjAWlNpMdxBYxbpSrgmIBZTLTlH613wVlft2dzMz06eFwi+rg9cIeypftPXLtbNQZCl3PW0Bf0PTHuqaH8ap4x7nR6/5fpj/+ui/GX3kylcYebo2lypNyg7XWGSaTjOO2MovJrgxVcMvah7L1um3dL9lvWuDz5muxFRdwuQBUpdwuQAKXcLkAClXC5IFKVcLkgClXBvKX7L+BI9j5P4EWna/rD1aH+7q/yzi2zs/1ifR0L93V/lnFmOL2w3yR6pO4XEI6OdKuK4gBR3Nvo1OMpaRHXo0VUwvOM4ynCnKEltTU8zSPT6Ijenpn8Lfur0WZy7NYx1YultHjCalSu6NWPWUm82ottOD4xknF8r7TRubVKo5wdB78dLhO1pR/vJLtjHiahYSYFwuAipQEMQKJsVxisCiENoTQKJksqwmgJAdgA2LDsVYDDaRlABIFBYFJPe0H/tul8dI0ZHh2Pc0R26N0njpVBeTM5eGsfLwgGOxu2UgUAsSBQhYVwGAtCAAFgC4CFh3BvJ8n8BClqfJ/AWO2/WG/Z0L93V/lnGXOw/WC/Y0L93V/lnHGOOfTDfJ7pO4XEBu2BcLgAsK563Qf0NM/g5/6lM8k9XoJ+zpn8FV/z0zOXZrHu8q45Su23reb5k3C5q2RcVwEChcLgIFC4XARbBcVwELCbFcbELBcAsAsa3rqlvl4WHrqlvl4WcvbgFuCGps6j11R3y8LD11R3y8LOY7EK/zkNTZ1Prqj70vCw9dUfel4Wctf5yKXLyQ1NnT+uqPvPws9vROmaPq+snKaT0qm8SimrqOpq+LtsfPkZ41ZWtmc+TCZiNZrq3hnXfq6BdM0fel4WHrqj70vCzmpP5yyJ7/I3TFun9dUfel4WHrqj70vCzmUD7S6mzqIdL0pNRi5Sb1JQk2+SRtynNR6x0dJwe/6PVw33XtY4zEtqfa/sFFpavZvuyJquzrI9IRbwpVXJuyiqU3Jvda1yPWtP+34Jfccrrd3dvvB7hqW6p9KU/7fgkOPSUG7LrG3kkqc229yyOUa4IXYsuQot1i6Sg3ZY27pJYJXbepZnqLo6vhjUVKbhKKkpRwyysnmk7pq6TVtZ8/45ZckE1fXnzt9pJiViYdVPpalFuMnKLTs04STT3NCfS9Gz9qWp6oSb1blrOWUbasl2GehTu83buy5CY6JE9X1T9Lel9Hqw0fE5UZRptRlVptY17N0rbvtOOfS1LfLwSJ6e0t6VCljk3KkpKP0Unite9kvdRzVSg1tPL/x48kcd83u8xHb6+nbnyxnL0dnTeuKXvPwyD1vS96XhZyzi+HwE4tbe49dQ4XLqvXFL3n4WL1xS95+FnKrmGIUW6n1xS95+Fnp9B9MUv6VdztLQ6sW1FZe1B3s2r6tSuzhLveXTqPf5tMznjMxUTTWOVTcukfS9L3peGQeuKXvPws5qVRvb9tjHn8o1SW6j1xS95+Fh63pb5eFnLNgKS3UeuKW9+Fi9cUt8vCzmL8ewMYot03rilvfhYeuKW+XhZzGO34A5lot03relvl4WL1xS3y8LOacxY/w1Ci3Svpelvl4WL1xS3y8LOauGL5yFFul9b0t8vCwObuvmwCktkcRYTawocYbsyjWlDDeOuzabtbtJtzNx2u5b23qzVxKNu/8mBrW7Awvj5mz1aWfkhYd221tgGFR4v4lYXqz7DIo3vr+dheHblltyIrWwcb/AAJtzNqFLE7ZZ32ZKxGDl2LUrhGBRKw6t/f+Rk6vb8rsBLXfbZfRWvsKIwFRWrPu3FtNLZrYlHK3xsrAYku0bhfIydurLXcLb1ZbkiDH1e/54goPz89xk8/xFxfx+b/iBLp/nu+8FSt932lW252ZkULfDK3ZcKx4NhnoLPLXreRjjFanlzRsUcsrtW7O9aySsNitJv5vkadTa9hu1HfLK7XBfA1JR2L7/wAtRmGpa019nMxyd9iXwNh67dzs0m+JjlHUtWz5saZYpR3Z33ahPUZMFsl8V35hx453KjE1868xpZZ37PvLtt2c9hWX52yXMDDJbtTtmK1nt+DNmTT1crZauJEbW3PnrAwfgEvPgZLanly1vksxKPBXezbbYEThfITe379Zb3fhnwzElfVnw+0CfneTFXyy7Lainwvu+bifZz3riAls/DULVnq+Je+/w1Bg3X5AYnLl+AfAyYeznkJq2S71buKMduIGbDz70AGz2mRxy2WsnYAAnrLdndYTd3s37gAAtfLar7ddgg72Wdn5CABrKye3c3szMiyfw3dwARWTQ85xv7sn/hbMEXfz1O2QATyeCv3rfvHOaV+dgAqLbvl53z1X+wxyi/e1Z88r/aAAY8T+/mwc7Nq2atfdd/mAAEpu3PU9q3lyqWtfa8K2gAUYmms81bUssyo3lbja25a8/IAIB3Wvta58jYozcs19XLPi9iACSsMk5NezlktWvfqfYY6qtw25Z/OwAConlbnmYZJ5J2zbVl3awAqIefHVr2bC8DeV7WvvssxABOG6u7XzaefLMVPPldW5gACSdr3eezZn8BdXdPcle3dt7QAIUXe/Zk9WauV1ex679iAACMtfB28uJNrq67U187wAoc1ZpPyy/LWKXl35iACpwtZt3V3zy4CUbxTTy4pX8hAA5O2f4hb5tYQBDwgAAf/Z",
      "date": "2023-07-13"
    }
  ];

  final List<Map<String, dynamic>> events = [
    {"date": DateTime(2023, 7, 20), "title": "Community Solar Workshop"},
    {"date": DateTime(2023, 7, 25), "title": "Wind Farm Open House"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 164, 187, 231),
      appBar: AppBar(
        title: Text("Renewable Energy News"),
        backgroundColor: Colors.lightBlue[600],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top News Section
              Text("Top Stories", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              Card(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: topNews.map((news) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(news['category']!, style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),
                          Text(news['title']!, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                          Divider(),
                        ],
                      );
                    }).toList(),
                  ),
                ),
              ),
              SizedBox(height: 20),

              // Recent News Section
              Text("Recent News and Projects", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              Column(
                children: recentNews.map((news) {
                  return Card(
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        children: [
                          Image.network(news['image']!, width: 80, height: 80, fit: BoxFit.cover, loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) return child;
                            return Container(
                              width: 80,
                              height: 80,
                              alignment: Alignment.center,
                              child: CircularProgressIndicator(
                                value: loadingProgress.expectedTotalBytes != null
                                    ? loadingProgress.cumulativeBytesLoaded / (loadingProgress.expectedTotalBytes ?? 1)
                                    : null,
                              ),
                            );
                          }, errorBuilder: (context, error, stackTrace) {
                            return Icon(Icons.broken_image, size: 80, color: Colors.grey);
                          }),
                          SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(news['title']!, style: TextStyle(fontWeight: FontWeight.bold)),
                                Text(news['description']!, style: TextStyle(color: Colors.grey[700])),
                                Text(news['date']!, style: TextStyle(color: Colors.grey)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
              SizedBox(height: 20),

              // Events Section
              Text("Upcoming Events", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              Card(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: events.map((event) {
                      return ListTile(
                        leading: Icon(Icons.event, color: Colors.blue),
                        title: Text(event['title']),
                        subtitle: Text(DateFormat('yyyy-MM-dd').format(event['date'])),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
