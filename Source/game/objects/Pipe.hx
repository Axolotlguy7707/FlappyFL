package game.objects;

import game.scenes.PlayScene;
import core.Game;
import core.physics.PhysicsSprite;
import box2D.collision.shapes.B2PolygonShape;
import box2D.dynamics.B2Body;
import box2D.dynamics.B2BodyDef;

class Pipe extends PhysicsSprite {

    public var destroyed:Bool = false;


    public function new(x:Float, y:Float) {
        super();

        graphics.beginFill(0x00FF00);
        graphics.drawRect(-25, -150, 50, 300);
        graphics.endFill();

        var bodyDef = new B2BodyDef();
        bodyDef.type = B2Body.b2_staticBody;
        bodyDef.position.set(
            x / PPM,
            y / PPM
        );

        body = Game.instance.physicsWorld.createBody(bodyDef);

        var shape = new B2PolygonShape();
        shape.setAsBox(
            25 / PPM,
            150 / PPM
        );

        body.createFixture2(shape);

        body.setUserData("pipe");
    }

    override public function update(delta:Float) {
        super.update(delta);

        if (this.x <= -100) {
            parent.removeChild(this);

            Game.instance.physicsWorld.destroyBody(body);
            body = null;

            trace('Pipe Destroyed!');

            destroyed = true;
        }
    }
}