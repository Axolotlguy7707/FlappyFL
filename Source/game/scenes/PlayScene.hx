package game.scenes;

import openfl.events.Event;
import lime.ui.KeyCode;
import openfl.events.KeyboardEvent;
import game.objects.Bird;
import core.Scene;

class PlayScene extends Scene {

    var bird: Bird;

    public function new() {
        super();

        addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
    }

    function onAddedToStage(e:Event):Void {
        stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
    }

    override public function create() {
        super.create();

        bird = new Bird();

        this.addChild(bird);
    }

    override public function update(delta:Float) {
        super.update(delta);

        if (bird != null) {
            bird.update(delta);
        }
    }

    function onKeyDown(e:KeyboardEvent) {
        if (e.keyCode == KeyCode.SPACE) {
            bird.flap();
        }
    }
}