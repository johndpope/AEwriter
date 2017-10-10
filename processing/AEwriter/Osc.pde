//based on oscP5parsing by andreas schlegel
import oscP5.*;
import netP5.*;

//String ipNumber = "127.0.0.1";
int receivePort = 7110;
OscP5 oscP5;

String[] oscChannelNames = { 
  "hand0", "hand1", 
  "finger0-0", "finger0-1", "finger0-2", "finger0-3", "finger0-4", 
  "finger1-0", "finger1-1", "finger1-2", "finger1-3", "finger1-4",
  "tool0-0", "tool0-1", "tool0-2", "tool0-3", "tool0-4", 
  "tool1-0", "tool1-1", "tool1-2", "tool1-3", "tool1-4"
};

void oscSetup() {
  oscP5 = new OscP5(this, receivePort);
}

void oscEvent(OscMessage msg) {
 try{
   for(int i=0;i<oscChannelNames.length;i++){
      if (msg.checkAddrPattern("/"+oscChannelNames[i]) && msg.checkTypetag("ifff")) { //a hand
        int idHand = msg.get(0).intValue();
        /*
        hands[idHand].show = true;
        hands[idHand].idHand = idHand;
        hands[idHand].t.x = sW * msg.get(1).floatValue();
        hands[idHand].t.y = sH * msg.get(2).floatValue();
        hands[idHand].t.z = sD * msg.get(3).floatValue();
        */
        //attempt to filter NaNs
        //if (hands[idHand].p.x > -10000 && hands[idHand].p.y > -10000 && hands[idHand].p.z > -10000){
          //println(hands[idHand].idHand + " " + hands[idHand].p);
        //}
     /*
     else if (msg.get(0).stringValue().equals("l_foot")) {
        s.lFootCoords[0] = msg.get(2).floatValue();
        s.lFootCoords[1] = msg.get(3).floatValue();
        s.lFootCoords[2] = msg.get(4).floatValue();
      } 
      */
    }else if (msg.checkAddrPattern("/"+oscChannelNames[i]) && msg.checkTypetag("iifff")) { //a finger
        int idHand = msg.get(0).intValue();
        int idFinger = msg.get(1).intValue();
        //~~
        tracker.p.x = sW * msg.get(2).floatValue();
        tracker.p.y = sH * msg.get(3).floatValue();
        tracker.p.z = sD * msg.get(4).floatValue();
        /*
        hands[idHand].oscFinger[idFinger].show = true;
        hands[idHand].oscFinger[idFinger].idHand = idHand;
        hands[idHand].oscFinger[idFinger].idFinger = idFinger;
        hands[idHand].oscFinger[idFinger].t.x = sW * msg.get(2).floatValue();
        hands[idHand].oscFinger[idFinger].t.y = sH * msg.get(3).floatValue();
        hands[idHand].oscFinger[idFinger].t.z = sD * msg.get(4).floatValue();
        */
        //attempt to filter NaNs
        //if (hands[idHand].oscFinger[idFinger].p.x > -10000 && hands[idHand].oscFinger[idFinger].p.y > -10000 && hands[idHand].oscFinger[idFinger].p.z > -10000){
          //println(hands[idHand].oscFinger[idFinger].idHand + " " + hands[idHand].oscFinger[idFinger].idFinger + " " + hands[idHand].oscFinger[idFinger].p);
        //}
    }else if (msg.checkAddrPattern("/"+oscChannelNames[i]) && msg.checkTypetag("siifff")) { //a tool
        int idHand = msg.get(1).intValue();
        int idTool = msg.get(2).intValue();
        //~~
        tracker.p.x = sW * msg.get(3).floatValue();
        tracker.p.y = sH * msg.get(4).floatValue();
        tracker.p.z = sD * msg.get(5).floatValue();
        /*
        hands[idHand].oscTool[idTool].show = true;
        hands[idHand].oscTool[idTool].idHand = idHand;
        hands[idHand].oscTool[idTool].idTool = idTool;
        hands[idHand].oscTool[idTool].t.x = sW * msg.get(3).floatValue();
        hands[idHand].oscTool[idTool].t.y = sH * msg.get(4).floatValue();
        hands[idHand].oscTool[idTool].t.z = sD * msg.get(5).floatValue();
        */
        //attempt to filter NaNs
        //if (hands[idHand].oscTool[idTool].p.x > -10000 && hands[idHand].oscTool[idTool].p.y > -10000 && hands[idHand].oscTool[idTool].p.z > -10000){
          //println(hands[idHand].oscTool[idTool].idHand + " " + hands[idHand].oscTool[idTool].idTool + " " + hands[idHand].oscTool[idTool].p);
        //}
    }
  }
 }catch(Exception e){ }
}
