package core;

import core.physics.ContactListener;
import box2D.common.math.B2Vec2;
import box2D.dynamics.B2World;
import haxe.Timer;
import openfl.display.Sprite;
import openfl.events.Event;
import core.Scene;
import openfl.geom.Rectangle;

class Game extends Sprite {

    public static var instance:Game;

    public static inline var GAME_WIDTH:Int = 720;
    public static inline var GAME_HEIGHT:Int = 480;

    var lastTime:Float;
    public var currentScene:Scene;

    public var physicsWorld:B2World;

    public function new(startingScene: Scene) {
        super();

        instance = this;

        lastTime = Timer.stamp();

        addEventListener(Event.ENTER_FRAME, update);
        addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);

        physicsWorld = new B2World(new B2Vec2(0, 5), true);

        physicsWorld.setContactListener(new ContactListener());

        currentScene = startingScene;
        this.addChild(currentScene);

        scrollRect = new Rectangle(0, 0, GAME_WIDTH, GAME_HEIGHT);
    }

    function onAddedToStage(e:Event) {
        stage.addEventListener(Event.RESIZE, onResize);
        onResize(null);
    }

    function onResize(e:Event) {
        var scale = Math.min(
            stage.stageWidth / GAME_WIDTH,
            stage.stageHeight / GAME_HEIGHT
        );

        scaleX = scale;
        scaleY = scale;

        x = (stage.stageWidth - GAME_WIDTH * scale) / 2;
        y = (stage.stageHeight - GAME_HEIGHT * scale) / 2;
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