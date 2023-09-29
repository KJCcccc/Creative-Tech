s.boot;

(
~gdrop = Buffer.read(s, "/Users/3856553/Desktop/no.1/audio/glass/glassdrop.wav");
~gvase = Buffer.read(s,"/Users/3856553/Desktop/no.1/audio/glass/crashvase.wav" );
)


~gvase.play;

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
	Synth.new(\play, [buf: ~gdrop, rate: -7.midiratio]);
	0.25.wait;
	Synth.new(\play, [buf: ~gdrop, rate: -5.midiratio]);
	0.25.wait;
	Synth.new(\play, [buf: ~gdrop, rate: 2.midiratio]);
	0.25.wait;
});
)

r.play;


(
r = Routine.new({

	inf.do({

		[-7, -5, 2, 0, 2].do({ |n|
			Synth.new(\play, [buf: ~gvase, rate: n.midiratio * rrand(1, 2), amp:0.4, hpf: n]);
			0.75.wait;
		});
	});
});
)

r.next;

r.play;
r.stop(3);

r.reset;

(
~soundG1 = Routine.new({

	inf.do({

		[0, -3, 8, -1, 4, 0, 2].do({ |n|
			Synth.new(\play, [buf: ~gvase, rate: n.midiratio * rrand(1,4), amp: 0.2, lpf: 60]);
			0.5.yield;
		});
	});
});
)

~soundG1.play;
~soundG1.stop(3);




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
		Synth.new(\play, [buf: ~gvase, rate: ~noteGen.next.midiratio, amp: 0.8]);
		0.5.yield;
	});
});
)
)

~soundGen.play;
~soundGen.stop;











		