package core;

import haxe.Timer;
import openfl.display.Sprite;
import openfl.events.Event;
import core.Scene;

class Game extends Sprite {

    public static var instance:Game;

    var lastTime:Float;
    public var currentScene:Scene;

    public function new(startingScene: Scene) {
        super();

        instance = this;

        lastTime = Timer.stamp();

        addEventListener(Event.ENTER_FRAME, update);

        currentScene = startingScene;
        this.addChild(currentScene);
        currentScene.create();
    }

    function update(e:Event) {
        var now = Timer.stamp();
        var delta = now - lastTime;
        lastTime = now;

        if (currentScene != null) {
            currentScene.update(delta);
        }
    }
}