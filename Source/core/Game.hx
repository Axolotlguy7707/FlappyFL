package core;

import box2D.common.math.B2Vec2;
import box2D.dynamics.B2World;
import haxe.Timer;
import openfl.display.Sprite;
import openfl.events.Event;
import core.Scene;

class Game extends Sprite {

    public static var instance:Game;

    var lastTime:Float;
    public var currentScene:Scene;

    public var physicsWorld:B2World;

    public function new(startingScene: Scene) {
        super();

        instance = this;

        lastTime = Timer.stamp();

        addEventListener(Event.ENTER_FRAME, update);

        physicsWorld = new B2World(new B2Vec2(0, 9), true);

        currentScene = startingScene;
        this.addChild(currentScene);
        currentScene.create();
    }

    function update(e:Event) {
        var now = Timer.stamp();
        var delta = now - lastTime;
        lastTime = now;

        physicsWorld.step(delta, 8, 3);

        if (currentScene != null) {
            currentScene.update(delta);
        }
    }
}