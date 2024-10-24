import 'package:flutter_svg/flutter_svg.dart';

SvgPicture polyhedralSix() {
  String svgString = '''
   <?xml version="1.0" encoding="UTF-8" standalone="no"?><!DOCTYPE svg PUBLIC "-//W3C//DTD SVG 1.1//EN"
        "http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd">
    <svg width="100%" height="100%" viewBox="0 0 11 11" version="1.1" xmlns="http://www.w3.org/2000/svg"
        xmlns:xlink="http://www.w3.org/1999/xlink" xml:space="preserve"
        xmlns:serif="http://www.serif.com/"
        style="fill-rule:evenodd;clip-rule:evenodd;stroke-linejoin:round;stroke-miterlimit:2;"><rect id="polyhedral_six" x="0.17" y="0.222" width="10.56" height="10.56" style="fill:none;"/>
        <g><path d="M8.63,1.062c0.696,-0 1.26,0.564 1.26,1.259l-0,6.361c-0,0.696 -0.564,1.26 -1.26,1.26l-6.36,-0c-0.696,-0 -1.26,-0.564 -1.26,-1.26l-0,-6.361c-0,-0.695 0.564,-1.259 1.26,-1.259l6.36,-0Z" style="fill:#d2609a;"/>
            <path
                d="M8.124,2.179c0.358,0 0.648,0.29 0.648,0.648l0,5.349c0,0.358 -0.29,0.648 -0.648,0.648l-5.349,0c-0.358,0 -0.648,-0.29 -0.648,-0.648l0,-5.349c0,-0.358 0.29,-0.648 0.648,-0.648l5.349,0Z"
                style="fill:#d28db0;" />
        </g>
    </svg>
   ''';

  return SvgPicture.string(
    svgString,
    width: 500,
    height: 500,
  );
}