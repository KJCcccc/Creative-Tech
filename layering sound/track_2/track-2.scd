s.boot;

(
~gdrop = Buffer.read(s,"audio/glass/glassdrop.wav".resolveRelative);
)


(
SynthDef.new(\play, {
	var sig, env;

	sig = PlayBuf.ar(
		numChannels: 1,
		bufnum: \buf.kr(0),
		rate: BufRateScale.kr(\buf.kr(0)) * \rate.kr(1),
		startPos: \spos.kr(0),
		loop: \loop.ir(0),
	);

	sig = LPF.ar(sig, \lpf.ir(20000).clip(20, 20000));
	sig = HPF.ar(sig, \lpf.ir(200));

	env = EnvGen.kr(
		Env(
			levels: [0, 1, 0],
			times: [\atk.ir(0.02), \rel.ir(3)],
			curve: [-2, -4],
		),
		doneAction: 2
	);

	//sig = Pan2.ar(sig, \pan.kr(0)); use for create 2 channel when audio only has one
	sig = sig * env;
	sig = sig * \amp.kr(2);

	Out.ar(\out.kr(0), sig);
}).add;
)


Synth.new(\play, [buf: ~gdrop, rate: 1.midiratio]);


























(
[-3, 0, 2].do({ |n|
	n = n + [11, 12, 0, -12, -24, -36].choose;
	Synth.new(
		\play,
		[
			buf: b.bufnum,
			rate: n.midiratio
			* rrand(-0.2, 0.2).midiratio
			* [1, -1].choose,
			pan: rrand(-0.8, 0.8),
			atk: exprand(0,002, 0,2),
			rel: exprand(3, 10),
			spos: s.sampleRate * rrand(2.0, 4.0),
			loop: 1
		]
	);
});
)

(
var scale = [0, 3, 5, 7, 10];
Array.fill(8, {scale.choose}).do({ |n|
	n = n + [12, 0, -12, -24, -36].choose;
	Synth.new(
		\play,
		[
			buf: b.bufnum,
			rate: n.midiratio
			* rrand(-0.2, 0.2).midiratio
			* [1, -1].choose,
			pan: rrand(-0.8, 0.8),
			atk: exprand(0,002, 0,2),
			rel: exprand(3, 10),
			spos: s.sampleRate * rrand(2.0, 4.0),
			loop: 1,
			amp: 0.8
		]
	);
});
)


(
var scale = [0, 3, 5, 7, 10];
var coll;
coll = scale.scramble;
coll = coll ++ scale.scramble[[0,1,2]];
coll.do({ |n|
	n = n + [11, 12, 0, -12, -24, -36].choose;
	Synth.new(
		\play,
		[
			buf: b.bufnum,
			rate: n.midiratio
			* rrand(-0.2, 0.2).midiratio
			* [1, -1].choose,
			pan: rrand(-0.8, 0.8),
			atk: exprand(0,002, 0,2),
			rel: exprand(3, 10),
			spos: s.sampleRate * rrand(2.0, 4.0),
			loop: 1,
			amp: 1,
			hpf: 6000,
			lpf: 1000,
		]
	);
});
)