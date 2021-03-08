import 'package:flutter/material.dart';
import 'package:rockets/models/rocket.dart';

class RocketTile extends StatelessWidget {
  final Rocket rocket;
  final VoidCallback onTap;

  RocketTile({Key key, @required this.onTap, this.rocket}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // This is how we can access the global theme created for the application
    final textTheme = Theme.of(context).textTheme;
    // We create a width variable that is equal to the screen size but no larger than 650 pixels
    final width = MediaQuery.of(context).size.width > 650
        ? 650
        : MediaQuery.of(context).size.width;

    return Align(
      alignment: Alignment.center,
      child: InkWell(
        onTap: onTap,
        child: Container(
          // Todo: Add padding to all edges of the image
          padding: null, // Hint EdgeInsets.all might help you
          width: width, // This sets width of container to fill the entire screen
          decoration: BoxDecoration(
            // Todo: Add BorderRadius as a decoration.
            borderRadius:
                null, // Hint: BorderRadius has a constructor called .circular
          ),
          child: Stack(children: [
            Hero(
              tag: 'rocket-image-${rocket.id}',
              // A unique identifier for the picture. We'll talk about this later
              child: ClipRRect(
                clipBehavior:
                    Clip.antiAlias, // Tells how hard we are cutting the image.
                // Todo: Add a border radius to the image as well.
                // Make it equal to its parent
                borderRadius: BorderRadius.circular(25),
                // Todo: Replace the Text below with an Image.
                // The first image from the Rocket localImages
                child:
                    Text(''), // Hint: The image widget has a .asset constructor
              ),
            ),
            Positioned(
              // Todo: Place the Positioned content at the bottom
              bottom: null,
              child: Container(
                  // Todo: Figure out the correct width
                  // Hint: This width should be equal to the outer parent, minus the padding given at the top.
                  width: null,
                  decoration: BoxDecoration(
                      // Todo: Add a Radius to the remaining corners.
                      borderRadius: BorderRadius.only(
                        topRight: Radius.zero,
                        topLeft: Radius.zero,
                      ),
                      // Todo: Give me a nice black color, with some opacity
                      color:
                          null // Hint: The Colors class provide a lot of colors
                      ),
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    // This aligns all the children in the column at the start of the column
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Add a rocket name here',
                        style: textTheme.headline6.copyWith(
                          color: Colors.white,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: Text(
                          'Add the rocket description here. It should be maximum 2 lines and overflowing text should be cut using ellipsis. The style should be of type subtitle2 and copied with the color white',
                          maxLines: null,
                          overflow: null,
                          style: null,
                        ),
                      )
                    ],
                  )),
            ),
          ]),
        ),
      ),
    );
  }
}
