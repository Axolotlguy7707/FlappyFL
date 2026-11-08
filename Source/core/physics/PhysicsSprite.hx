package core.physics;

import openfl.display.Sprite;
import box2D.dynamics.B2Body;

class PhysicsSprite extends Sprite {
    public var body:B2Body;

    public var PPM:Int = 30;

    public function new() {
        super();
    }

    public function update(delta:Float):Void {
        if (body == null) return;

        x = body.getPosition().x * PPM;
        y = body.getPosition().y * PPM;
        rotation = body.getAngle() * 180 / Math.PI;
    }
}