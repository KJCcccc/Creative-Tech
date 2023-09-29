Server.local.boot;

"open -a 'Audio MIDI Setup'".unixCmd;

p = ProxySpace.new.push;

~sig.play;
~sig2.play;
~sig.fadeTime = 2;
~sig = {SinOsc.ar([440,443] * -5.midiratio) * -20.dbamp * LFPulse.kr(6,0,0.3)}
~sig2 = {PinkNoise.ar(-20.dbamp!2)}
~sig = nil;


~sig.stop(3);



b = ();
b.put(\stest1, Buffer.read(s, "/Users/3856553/Desktop/CT-P1/stest1.wav"));
b.stest1.numChannels;
b.stest1.duration;
b.stest1.play;

~buf.play;
~buf.fadeTime = 1;
~buf = {PlayBuf.ar(2, b.stest1) * -12.dbamp!2}
~buf = {PlayBuf.ar(2, b.stest1, 2) * -12.dbamp!2} //speed: x2
~buf = {PlayBuf.ar(2, b.stest1, 0.5) * -12.dbamp!2} //speed: x0.5
~buf = {PlayBuf.ar(2, b.stest1, -1.midiratio) * -12.dbamp!2} //with midi
~buf = {PlayBuf.ar(2, b.stest1, -2.midiratio) * -12.dbamp!2} //with midi
~buf = {PlayBuf.ar(2, b.stest1, -3.midiratio) * -12.dbamp!2} //with midi
~buf = {PlayBuf.ar(2, b.stest1, -4.midiratio) * -12.dbamp!2} //with midi
~buf = {PlayBuf.ar(2, b.stest1, -5.midiratio) * -12.dbamp!2} //with midi
~buf = {PlayBuf.ar(2, b.stest1, -5.midiratio, loop:2) * -12.dbamp!2} //with midi>
~buf = nil;



