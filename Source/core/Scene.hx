package core;

import openfl.display.Sprite;
import openfl.events.Event;

class Scene extends Sprite {

    public function new() {
        super();

        addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
    }

    private function onAddedToStage(e:Event):Void {
        removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
        create();
    }

    public function create():Void {}

    public function update(delta:Float):Void {}
}