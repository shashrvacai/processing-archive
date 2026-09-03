class Tentacle
{

  final int MAX_NEW_TENTACLES = 2 - 1;//max nb of new tentacles at a time
  final int NB_CIRCLES_MIN = 18;
  final int NB_CIRCLES_MAX = 98;
  final float DISTANCE_MIN = .25;//min percentage of the radius
  final float DISTANCE_MAX = .4;//max percentage of the radius
  final float DIST_VAR_MAX = .2;//max evolution of the distance
  final float EVOL_RANDOM = .5;//percentage of big/small circles center's moves 
  final int TENTACLE_SIZE_MIN = 18;//min number of circles per tentacle
  final float DISPERTION_RATE = .065;//chance that a tentacle will split

  PVector center = new PVector(0, 0);
  float prevX;//previous x position of the circle
  float prevY;//previous y position of the circle
  float prevDist = random(DISTANCE_MIN, DISTANCE_MAX);//previous distance between two circles
  int nbCirclesTotal = (int)random(NB_CIRCLES_MIN, NB_CIRCLES_MAX);
  int nbCircles;//current count on the number of circles
  float m_angle = random(TWO_PI);//angle between two circles
  color m_color = color(map(mouseX,0,width,0,255), 0, 158);//color of the circles

  Tentacle(PVector p_center, int p_nbCircles, int p_nbCirclesTotal)
  {
    nbCirclesTotal = p_nbCirclesTotal > 0 ? p_nbCirclesTotal : nbCirclesTotal;
    nbCircles = p_nbCircles;
    center = p_center;
    prevX = center.x;
    prevY = center.y;
  }

  void update(int p_rank)  {
    if (nbCircles < nbCirclesTotal)   {
      if (random(1) < DISPERTION_RATE && (nbCirclesTotal-nbCircles) > NB_CIRCLES_MIN)
      {
       removeTentacleNb(p_rank);
        int nbNewTentacles = 1 + (int)random(MAX_NEW_TENTACLES);
        for (int i = 0; i < nbNewTentacles; i++)
        {
          tentaclesToAdd.add(new Tentacle(new PVector(prevX, prevY), nbCircles, (int)random(.9*nbCirclesTotal, nbCirclesTotal)));
        }
        return;
      }

      nbCircles++;
      if (prevDist < DISTANCE_MIN + (DISTANCE_MAX - DISTANCE_MIN)/2)
      {
        prevDist = prevDist + DIST_VAR_MAX * random(EVOL_RANDOM) * (random(1) < EVOL_RANDOM ? -1 : 1);
        }
      else
      {
        prevDist = prevDist + DIST_VAR_MAX * random(EVOL_RANDOM) * (random(1) < EVOL_RANDOM ? 1 : -1);
        }

        m_angle += (random(1) - .5) * PI / 4;
      float l_curDiameter = 6 * sqrt(.9 * (nbCirclesTotal - nbCircles));
      float l_curX = prevX + l_curDiameter * prevDist * cos(m_angle) / 3;
      float l_curY = prevY + l_curDiameter * prevDist * sin(m_angle) / 3;

      if (l_curX < 0 || l_curY < 0)
      {
        removeTentacleNb(p_rank);
        return;
      }

      stroke(0, 90);
      fill(m_color);
      ellipse(l_curX, l_curY, l_curDiameter, l_curDiameter);

      prevX = l_curX;
      prevY = l_curY;
    }
    else
    {
      removeTentacleNb(p_rank);
    }
  }

  void removeTentacleNb(int p_rank)
  {
    int[] trmv = {
      p_rank
    };
    tentaclesToRemove = concat(tentaclesToRemove, trmv);
  }
}
