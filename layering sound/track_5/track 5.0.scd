s.boot;

(
~gdrop = Buffer.read(s, "/Users/3856553/Desktop/no.1/audio/glass/glassdrop.wav");
~gvase = Buffer.read(s, "/Users/3856553/Desktop/no.1/audio/glass/crashvase.wav" );
~gfall = Buffer.read(s, "/Users/3856553/Desktop/no.1/audio/glass/glassfall.wav");
~gimpact = Buffer.read(s, "/Users/3856553/Desktop/no.1/audio/glass/impactglass.wav");
~gbottle = Buffer.read(s, "/Users/3856553/Desktop/no.1/audio/glass/glassbottle.wav");
)

~gdrop.play;

(
SynthDef.new(\play, {
	var sig, env;

	sig = PlayBuf.ar(
		numChannels: 2,
		bufnum: \buf.kr(0),
		rate: BufRateScale.kr(\buf.kr(0)) * \rate.kr(1),
		startPos: \spos.kr(0),
		loop: \loop.ir(0)
	);

	sig = LPF.ar(sig, \lpf.ir(20000).clip(20, 20000));
	sig = HPF.ar(sig, \hpf.ir(20).clip(20, 20000));

	env = EnvGen.kr(
		Env(
			levels: [0, 1, 0],
			times: [\atk.ir(0.02), \rel.ir(3)],
			curve: [-2, -4],
		),
		doneAction: 2
	);

	sig = Pan2.ar(sig, \pan.kr(0));
	sig = sig * env;
	sig = sig * \amp.kr(1);

	Out.ar(\out.kr(0), sig);
}).add;
)

(
r = Routine.new({
	Synth.new(\play, [buf: ~gfall, rate: -7.midiratio]);
	0.25.wait;
});
)

r.play;


(
r = Routine.new({

	3.do({

		[-7, -5, 2].do({ |n|
			Synth.new(\play, [buf: ~gvase, rate: n.midiratio]);
			0.5.wait;
		});
	});
});
)


r.next;

r.play;
r.stop;

r.reset;

(
~noteGen = Routine.new({
	var pch;
	pch = -12;
	inf.do({
		8.do({
			pch.yield;
			pch = pch + rrand(1,6);
		});
	});
});

(
~soundGen = Routine.new({
	inf.do({
		Synth.new(\play, [buf: ~gbottle, rate: ~noteGen.next.midiratio]);
		0.25.yield;
	});
});
)
)

~soundGen.stop;

(
~soundGen1 = Routine.new({
	inf.do({
		[-7, -5, 2].do({ |n|
			Synth.new(\play, [buf: ~gvase, rate: n.midiratio, amp:0.5]);
			0.5.yield;
		});
	});
});
)

~soundGen1.play;
~soundGen1.stop(3);


(
~soundGen2 = Routine.new({
	inf.do({
		[2, 4, 10].do({ |n|
			Synth.new(\play, [buf: ~gbottle, rate: n.midiratio, amp: 3]);
			1.0.yield;
		});
	});
});
)

~soundGen2.play;
~soundGen2.stop(3);

(
~soundGen3 = Routine.new({
	inf.do({
			Synth.new(\play, [buf: ~gvase, rate: n.midiratio, rel: 2]);
			0.5.yield;
		});
	});
)


~soundGen3.play;
~soundGen2.stop;












		