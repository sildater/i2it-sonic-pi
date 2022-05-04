=begin

Hi there!
________________ SONIC PI BASICS _____________________

Sonic Pi:
(Live) Coding environment for music and sound
Based on supercollider and the ruby language

Ruby:
# for comments
parantheses are optional
loops are marked with "do ... end"

________________ SIGNALS & SAMPLES _____________________


1. desribing a digital signal
what is Analog/Digital conversion?
what is the sampling rate? 
what is the bit depth?

2. manipulating envelopes: start, end, attack, decay, ..
start: 0.2, finish: 0.3, ...

3. manipulating bits: random numbers, sine & bit crushing
with_fx :bitcrusher sample_rate: 1000, bits: 8 do
...
end

what does a wave with bit depth 1 look like?
what does a wave with sample rate of 10 sound like? and why?

4. manipulating rates: how fast is it played (what do negative values mean?)
rate: 1.2


________________ SPECTRUM, SINUSOIDS, & ADDITIVE SYNTHESIS _____________________

-> What are waves?

periodicity -> period (wavelength), frequency
amplitude -> bit depth
waveforms -> common shapes of waves; triangele, sawtooth, square, sine
sine waves / sinusoids

-> Why should we care about sine waves?

A (windowed) wave can be seen as a combination of simple sine waves
*any* signal can be decomposed
frequencies of the sine components increase by integer numbers, starting from the lowest
amplitudes depend on the input signal
uncertainty principle

-> How do we get the amplitudes?

Fourier transform (FFT, STFT)
Spectrogram: https://spectrogram.sciencemusic.org/

-> How can we create special waveforms with a combination of sine waves?

the harmonic / overtone series
changing timbre by changing the amplitudes of the components

combine harmonic sines with attenuation per octave: https://editor.p5js.org/sildater/sketches/KF_HfdVd6
combine random sines with different attacks: https://editor.p5js.org/sildater/sketches/IsoexBZUb

relation to 12 tone equal temperament

=end

live_loop :ll1 do
  with_fx :bitcrusher, sample_rate: rrand(20000,40000), bits: rrand(6 ,16) do
    sample(:loop_perc1, start: rrand(0.73,0.9), finish: 0.7, rate: rrand(0.7,1.3))
  end
  sleep sample_duration(:loop_perc1)/5
  sample :bd_haus, cutoff: 60
end