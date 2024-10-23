import 'package:flutter/material.dart';
import 'package:pro/Models/ticket_request.dart';
import 'package:pro/component/my_ticket_detail.dart';

class TicketCard extends StatelessWidget {
  final MaintenanceTicket ticket;

  TicketCard({required this.ticket});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 30,
      color: Theme.of(context).colorScheme.secondary,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title and subtitle in a row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Title: ${ticket.title}',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                // Ticket ID for example
                Text(
                  'ID: ${ticket.ticketID}',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onSecondary,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),

            // Custom subtitle (urgency)
            Text(
              'Urgency: ${ticket.urgency}',
              style: TextStyle(
                color: Theme.of(context).colorScheme.onSecondary,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            // Add more information here (description, status, etc.)

            const SizedBox(height: 20),
            Text(ticket.assignedTo),
            const SizedBox(height: 20),

            // Row for status and any other actions
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Status: ${ticket.status}',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onSecondary,
                    fontSize: 16,
                  ),
                ),
                IconButton(
                  icon: Column(
                    children: [
                      Icon(
                        Icons.info,
                        color: Theme.of(context).colorScheme.onSecondary,
                      ),
                      const Text(
                        "Read More",
                        style: TextStyle(color: Colors.blue),
                      )
                    ],
                  ),
                  onPressed: () {
                    // Navigate to ticket detail page
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TicketDetailPage(ticket: ticket),
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
