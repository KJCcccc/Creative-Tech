s.boot;

p = ProxySpace.new.push;


b = ();
b.put(\wrub, Buffer.read(s, "/Users/3856553/Desktop/no.1/audio/wood/rub.wav"));
b.put(\wcrack, Buffer.read(s, "/Users/3856553/Desktop/no.1/audio/wood/crack.wav"));
b.put(\wpd, Buffer.read(s, "/Users/3856553/Desktop/no.1/audio/wood/plankdown.wav"));



~buf11.fadeTime = 4;
~buf = {PlayBuf.ar(2, b.wrub, 2.midiratio, loop:1, amp:1) * -12.dbamp!2}
~buf1 = {PlayBuf.ar(2, b.wrub, 4.midiratio, loop:1, amp: 0.5) * -12.dbamp!2}
~buf2 = {PlayBuf.ar(2, b.wrub, 8.midiratio, loop:1, amp: 2) * -12.dbamp!2}
~buf4 = {PlayBuf.ar(2, b.wrub, -2.midiratio, rel: 2, loop:1, amp: 0.3) * -12.dbamp!2}
~buf5 = {PlayBuf.ar(2, b.wrub, -6.midiratio * rrand(1,5), pan: rrand(-0.5,0.5), loop:1, amp:0.2) * -12.dbamp!2}
~buf6 = {PlayBuf.ar(2, b.wcrack, 6.midiratio, pan: rrand(-0.5,0.5), loop:1, amp: 0.3) * -12.dbamp!2}
~buf7 = {PlayBuf.ar(2, b.wcrack, 3.midiratio, rel: 0.1, loop:1, amp:0.2) * -12.dbamp!2}
~buf8 = {PlayBuf.ar(2, b.wpd, 1.midiratio, loop:1, amp:0.2) * -12.dbamp!2}
~buf9 = {PlayBuf.ar(2, b.wpd, -3.midiratio, loop:1, amp:0.4) * -12.dbamp!2}
~buf10 = {PlayBuf.ar(2, b.wpd, 7.midiratio, atk: 0, rel: 0, loop:1, amp:1) * -12.dbamp!2}
~buf11 = {PlayBuf.ar(2, b.wpd, 20.midiratio*rrand(1,5), atk: 0.02, rel: 0.01, loop:1, amp:0.3) * -12.dbamp!2}

~buf2.play;
~buf8.stop;
~buf6.stop(5);
