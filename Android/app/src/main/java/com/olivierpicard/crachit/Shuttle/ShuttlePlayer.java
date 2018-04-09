package com.olivierpicard.crachit.Shuttle;

import android.graphics.Color;

import com.olivierpicard.crachit.AnimatedItem.Asteroid;
import com.olivierpicard.crachit.GameScene;
import com.olivierpicard.crachit.Graphics.GPoint;
import com.olivierpicard.crachit.Graphics.GVector;
import com.olivierpicard.crachit.ICollisionable;
import com.olivierpicard.crachit.LaserShot;
import com.olivierpicard.crachit.R;
import com.olivierpicard.crachit.Tools;

/**
 * Représente le vaisseau du joueur sur la scène
 * Created by olivierpicard on 06/04/2018.
 */

public class ShuttlePlayer extends Shuttle {

    public ShuttlePlayer() {
        super(R.mipmap.shuttle_1, Color.RED,
                new Stats(230, 35,
                        new ShootStats(1/6, 48)));
        this.direction = GVector.zero();
        this.lifeBar.setPosition(new GPoint(this.getPosition().x,
                this.getPosition().y - this.getSize().height/2 - this.lifeBar.getSize().height/2 - 8));

    }


    @Override
    public void update(double currentTime) {
        if(this.getScene() != null
                && this.direction.dx < 0 && this.getPosition().x > this.getSize().width/2
                || this.direction.dx > 0
                && this.getPosition().x < Tools.screenMetrics.widthPixels - this.getSize().width/2) {
            super.update(currentTime);
        }
        if(this.stats.shoot_stats.canShoot(currentTime))
            shoot(GVector.up(), this.getZRotation());
    }



    @Override
    public void inCollisionWith(ICollisionable item) {
        if(item instanceof LaserShot) {
            final LaserShot laser = (LaserShot)item;
            if(laser.shooter == this) return;
            this.lifeBar.setValue(this.lifeBar.getValue() - laser.shooter.stats.attack);
        }
        else if(item instanceof ShuttleEnemy)
            this.lifeBar.setValue(0);
        else if(item instanceof Asteroid) {
            final Asteroid asteroid = (Asteroid) item;
            this.lifeBar.setValue(this.lifeBar.getValue() - asteroid.dammage);
        }

        if(this.lifeBar.getValue() == 0) {
            final GameScene scene = (GameScene)getScene();
            scene.gameOver();
//            TODO: Configure explosion
//            scene.addChild(new Explosion(new GPoint(getPosition())));
            scene.removeChild(this);
        }
    }
}
