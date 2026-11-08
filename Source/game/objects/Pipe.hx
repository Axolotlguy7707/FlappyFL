package game.objects;

import openfl.display.Sprite;

class Pipe extends Sprite {
    public function new() {
        super();

        graphics.beginFill(0x00FF00);
        graphics.drawRect(0, 0, 50, 300);
        graphics.endFill();
    }
}