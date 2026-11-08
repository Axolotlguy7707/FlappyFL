package game.scenes;

import game.objects.Bird;
import core.Scene;

class PlayScene extends Scene {

    var bird: Bird;

    public function new() {
        super();
    }

    override public function create() {
        super.create();

        bird = new Bird();

        this.addChild(bird);
    }

    override public function update(delta:Float) {
        super.update(delta);
        
        bird.update(delta);
    }
}