
\version "2.22.1"
#(set-global-staff-size 17)
\include "AdditionalFunctions.ly"
\include "VariablesJazz.ly"
\include "jazzchords.ily"
\include "lilyjazz.ily"

#(set! paper-alist (cons '("tabII" . (cons (* 25.41 cm) (* 15.73 cm))) paper-alist))


\paper {
  indent = 0\mm
  print-page-number = ##f
  ragged-last-bottom = ##f
  ragged-bottom = ##t
  ragged-last = ##f
  markup-system-spacing = #'((basic-distance . 23)
                             (minimum-distance . 8)
                             (padding . 1))
  score-system-spacing = #'((basic-distance . 23)
                            (minimum-distance . 20)
                            (padding . 5))
}

title = #"213 Cha Cha"
composer = #"David Torres"
meter = #"(Med. Salsa)"
kwtempo = #"Medium"
kwstyle = #"Salsa"

realBookTitle = \markup {
  \score {
    {
      \override TextScript.extra-offset = #'(0 . -4.5)
      s4
      s^\markup {
        \fill-line {
          \fontsize #1 \lower #1 \rotate #7 \concat { " " #meter }
          \fontsize #4
          \override #'(offset . 9)
          \override #'(thickness . 6)
          \underline \larger \larger #title
          \fontsize #1 \lower #1 \concat { #composer " " }
        }
      }
      s
    }
    \layout {
      \omit Staff.Clef
      \omit Staff.TimeSignature
      \omit Staff.KeySignature
      ragged-right = ##f
    }
  }
}

\header {
  pdftitle = #title
  pdfauthor = #composer
  pdfkeywords = \markup \concat { #kwtempo " " #kwstyle }
  title = \realBookTitle
  asplayed = #"Poncho Sanchez" % doit être commentée si vide
  url = #"https://www.youtube.com/watch?v=oguo-OmuSCU"
  arranger = \markup \on-the-fly #played?
  \with-url #url
  \underline
  \concat { "(as played by " \fromproperty #'header:asplayed ")" }
  tagline = ##f
}

\layout {
  \context {
    \Score
    %voltaSpannerDuration = #(ly:make-moment 4 4)
    \override Glissando #'style = #'zigzag
    \override Glissando.breakable = ##t
    \override Glissando.after-line-breaking = ##t
    startRepeatType = #"[|:"
    endRepeatType = #":|]"
    doubleRepeatType = #":|][|:"
    \override Clef #'break-visibility = #'#(#f #f #f)
    \override KeySignature #'break-visibility = #'#(#f #f #f)
    \override SystemStartBar #'collapse-height = #1
    \override ParenthesesItem.font-size = #2
  }
  \context { 
    \Staff
    printPartCombineTexts = ##f
    \consists "Merge_rests_engraver"
  }
  \context {
    \ChordNames
    \override ParenthesesItem.font-size = #2
  }
}



ossatureTab = \relative c {
  \autoPageBreaksOff
  \mark \markup { \bold \box \fontsize #2 A \with-color #red { "Solo continue on " \box A" last x" } }
  \repeat volta 3 { s1*2 } \mark \markup 3X s1*2 \break \bar "||"
  \B  s1*4 \break s1*4 \break \bar "||" 
  \B  s1*4 \break s1*4 \bar "||"
  \C \pageBreak s1*4 \break s1*4 \break \bar "||"
  \B  s1*4 \break s1*3 
  s1 ^\markup \with-color #red \fontsize #2 "Solo Break" \bar ".."
  \once \override Score.RehearsalMark #'direction = #DOWN
  \once \override Score.RehearsalMark #'self-alignment-X = #RIGHT
  \once \override Score.RehearsalMark.extra-offset = #'(1 . -1)
  \mark \markup  \with-color #red \fontsize #2 "Solos on ABBCB then D.C."
}

ossature = \relative c {
  \mark \markup { \bold \box \fontsize #2 A \with-color #red { "Solo continue on " \box A" last x" } }
  \repeat volta 3 { s1*2 } \mark \markup 3X s1*2 \break \bar "||"
  \B  s1*4 \break s1*4 \break \bar "||" 
  \B  s1*4 \break s1*4 \break \bar "||"
  \C  s1*4 \break s1*4 \break \bar "||"
  \B  s1*4 \break s1*3 
  s1 ^\markup \with-color #red \fontsize #2 "Solo Break" \bar ".."
  \once \override Score.RehearsalMark #'direction = #DOWN
  \once \override Score.RehearsalMark #'self-alignment-X = #RIGHT
  \once \override Score.RehearsalMark.extra-offset = #'(1 . -1)
  \mark \markup  \with-color #red \fontsize #2 "Solos on ABBCB then D.C."
}



harmonies = \chordmode {
  \set chordChanges = ##f
  f2:sus4.7 s8 des4:7+/f f8:sus4.7 s1
  f2:sus4.7 s8 des4:7+/f f8:sus4.7 s1
  
  g2:7.9- c4.:5+7 f2:7 d2:7 s8 e2:7 fis4.:7 f1:sus4 s8
  des2:7 c4.:5+7 f4:sus4.7 b4:5+7 bes8:7 s2 
  des2:5/es es4.:7/+bes f8:m6/as s1 
  
  g2:7.9- c4.:5+7 f2:7 d2:7 s8 e2:7 fis4.:7 f1:sus4 s8
  des2:7 c4.:5+7 f4:sus4.7 b4:5+7 bes8:7 s2 
  f2..:m5-7/ces bes1:9 s8
  
  des2..:7 ges8:maj7 s1 | % 27
  f4:5+7.9-11+ s4 s4. es8:9 | % 28
  s1 | % 29
  des4:9+ s4 c4:9+ s8 bes8:m6 |
  s4. a8:5+7.9-11+ s4. as8:6 | % 31
  s4. g8:7 s4. c8:7.9+ | % 32
  s1 | % 33
  g2:7.9- c4.:5+7 f2:7 d2:7 s8 e2:7 fis:7 f1:7sus4
  des2:7 c4.:5+7 f4:sus4.7 b4:5+7 bes8:7 s2 
  
  des4:9 s4. c8:7.5+.9-.11+ s8 f8:m6
}

harmoniesR = \chordmode {
  \set chordChanges = ##f
  f2:sus4.7 s8 des4:7+/f f8:sus4.7 s1
  f2:sus4.7 s8 des4:7+/f f8:sus4.7 s1
  
  g2:7.9- c4.:5+7 f2:7 d2:7 s8 e2:7 fis4.:7 f1:sus4 s8
  des2:7 c4.:5+7 f4:sus4.7 b4:5+7 bes8:7 s2 
  des2:5/es es4.:7/+bes f8:m6/as s1 

  f2..:m5-7/ces bes1:9 s8
  
  des2..:7 ges8:maj7 s1 | % 27
  f4:5+7.9-11+ s4 s4. es8:9 | % 28
  s1 | % 29
  des4:9+ s4 c4:9+ s8 bes8:m6 |
  s4. a8:5+7.9-11+ s4. as8:6 | % 31
  s4. g8:7 s4. c8:7.9+ | % 32
  s1 | % 33
  g2:7.9- c4.:5+7 f2:7 d2:7 s8 e2:7 fis:7 f1:7sus4
  des2:7 c4.:5+7 f4:sus4.7 b4:5+7 bes8:7 s2 
  
  des4:9 s4. c8:7.5+.9-.11+ s8 f8:m6
}


theNotesI =  \relative c'' {
  \clef "treble" \key as \major \time 4/4
  \showStartRepeatBar \bar "[|:"
  \set Staff.instrumentName = \markup { \center-column { "Horn 1" \line { "(A. Sax)" } } }
  \override Rest.staff-position = #0
  \override MultiMeasureRest.staff-position = #0
  R1*3
  r2 r8  c8  bes8  f8 
  as2..  f8-> | 
  R1 | % 11
  r8  d8  as'8  des?8  es8  bes8
  e,8  f8 ~ \fp \< | % 12
  f2. r4 \! | 
  r8  ces8  f8  bes8  as8  es8
  bes8  f'8 | % 14
  r8  g8 r8  as8 ~  as2 | % 15
  f2 r8  des8 r8  d8 ~ | % 16
  d2 r8  c'8  bes8  f8 
  as2..  f8 | % 18
  R1 | % 19
  r8  d8  as'8  des?8  es8  bes8
  e,8  f8 \fp -\< ~ | 
  f2.  r4 -\! |
  r8  ces8  f8  bes8  as8  es8
  bes8  f'8 | % 22
  r8  g8 r8  as8 ~  as2 | % 23
  as2  f8  as8 r8  f8 ~ | f2. r4 | 
  as4 -. -\bendAfter #4 -\sfz  as4 -.
  -\bendAfter #4  r4 r8  f8 ~ -\fp -\< | % 26
  f2. r4 -\! | % 27
  es'4 -. -\bendAfter #4 -\sfz r4 r4.  f,8 ~ -\fp
  -\< | % 28
  f2. r4 | 
  e'4 -. -\bendAfter #4 -\! -\sfz  e4 -.
  -\bendAfter #4   es4 -. -\bendAfter #4  r4  
  R1 | r4. des,8~ \pp 4. bes8~ \< | 2  r8 \f c'8  bes8  f8 
  %   r8  es,4 -\f  g8 ~  g8  a4 bes8 ~ | 
  %    bes8  c4  cis8 ~  cis8  c8  cis8  d8 ~ |  
  %    d2 r8 d8  c8  g8 
  as2..  f8 | % 34
  R1 | % 35
  r8  d8  as'8  des?8  es8  bes8
  e,8  f8 ~ | % 36
  f2. r4 | % 37
  r8  ces8  f8  bes8  as8  es8
  bes8  f'8 | % 38
  r8  g8 r8  as8 ~  as2 | % 39
  % f2 r8  f4 -.  e8 -. | 
  bes4 as8 f r as4-. f'8-^
  R1 
}


theNotesII =  \relative c'' {
  \clef "treble" \key as \major \time 4/4
  \set Staff.instrumentName = \markup { \center-column { "Horn 2" \line { "(Flugelh.)" } } }
  \showStartRepeatBar \bar "[|:"
  \override Rest.staff-position = #0
  \override MultiMeasureRest.staff-position = #0
  R1*3
  r2 r8  c8  bes8  f8 
  as2..  f8-> | 
  R1 | % 11
  r8  d f des' es bes e, f8 ~ \fp \< | % 12
  f2. r4 \!| % 13
  r8  ces8  f8  bes8  as8 
  es8  bes8  f'8 | % 14
  r8  g8 r8  as8 ~  as2 | % 15
  as4  f8  f8 r8  g8 r8 
  f8 ~ | % 16
  f2 r2 | 
  r4  f4  e4.  c8 | % 18
  r8  d8 r8  es8 r8  d8  c4 | % 19
  r8  d f des' es bes e, f8 ~ \fp \< | % 12
  f2. r4 \!| % 13
  r4   f4  e4.  es8 | % 22
  r8  es8 r8  f8 ~  f2 | % 23
  as2 f8 as r f~ | f1
  as'4 -. -\sfz  as4 -.  r4 r8  f8 ~
  -\fp -\< | % 26
  f2. r4 -\! | % 27
  as4 -. -\sfz r4 r4.  f8 ~  | % 28
  f2. r4 | 
  as4-. as-. as -.r4
  R1 | 
  r4.  f,8~ \pp 4. es8~ \< | 2.  r4 \!
  r4 \mf f4  e4.  c8 | % 34
  r8  d8 r8  es8 r8  d8  c4 | % 35
  r8  d f des' es bes e, f8 ~ \fp \< | % 12
  f2. r4 \!| % 13
  r4  f4  e4.  es8 | % 38
  r8  es8 r8  f8 ~  f2 | % 39
  es2 r8 es4-. d8-^
  %  g4  f8  d8 r8  f4 -. d'8 -. |
  R1 
}

theNotesIII =  \relative c' {
  \key as \major \time 4/4
  \set Staff.instrumentName = \markup { \center-column { "Horn 3" \line { "(Trombone)" } } }
  \override Rest.staff-position = #0
  \override MultiMeasureRest.staff-position = #0
  \showStartRepeatBar \bar "[|:"
  R1*3
  r2 r8  c8  bes8  f8 | 
  as2..  f8-> |
  R1 | % 11
  r8  d8  as'8  des?8  es8  bes8
  e,8  bes'8 ~ \fp \< | % 12
  bes2. r4 \! |  % 13
  r8  ces8  f8  bes8  as8
  es8  bes8  f'8 | % 14
  r8  es8 r8  d8 ~  d2 | % 15
  des2 r8  des8 r8  c8 ~ | % 16
  c2 r2 |  
  r4  b4 -\p  bes4.  as8 | % 18
  r8  bes8 r8  c8 r8  bes8  as4 | % 19
  r8  d,8  as'8  des?8  es8  bes8
  es,8  bes'8 \fp \< ~ | 
  bes2. r4 \! | \noPageBreak
  r4  ces4  bes4.  bes8 | % 22
  r8  des8 r8  d8 ~  d2 | % 23
  es2. r8  c8 ~ | % 24
  c4.  bes8 ~  bes4  as4 |  
  as4 -. -\sfz  as4 -.  r4 r8  bes8 ~
  -\fp -\< | % 26
  bes2. r4 -\! | % 27
  a'4 -. -\sfz r4 r4.  c,8 ~ -\fp -\< | % 28
  c2. r4 |
  ces4 -. -\! -\sfz  ces4 -.   bes4 -.
  r8 \pp  c8 ~ -\< | 
  c4.  c8 ~  c4.  c8 ~ | % 31
  c4.  b8 ~  b4.  e,8 ~ | % 32
  e2.  r4 -\! | 
  r4 \mf b'4  bes4.  as8 | % 34
  r8  bes8 r8  c8 r8  bes8  as4 | % 35
  r8  d,8  as'8  des?8  es8  bes8
  es,8  bes'8 ~ | % 36
  bes2. r4 | % 37
  r4  b4  bes4.  bes8 | % 38
  r8  des8 r8  es8 ~  es2 | % 39
  ces2 r8  c,4 -.  f8 -^ |
  R1 
}

Piano =  \relative c {
  \clef "treble_8" \key as \major \time 4/4
  \set Staff.instrumentName =\markup {
    \center-column { "Piano or"
                     \line { "Guit." }
    }
  }
  \override Rest.staff-position = #0
  \override MultiMeasureRest.staff-position = #0
  \showStartRepeatBar \bar "[|:" 
  \mark \markup { \bold \box \fontsize #2 A \with-color #red { "Solo cont. on " \box A" last x" }  }
  \repeat volta 3 {
    r4 \mf  <f c' es bes'>4 -. r8  <f c' des as'>8 -. r8  <f c' es bes'>8 ~ |
    q4.  <f c' des as'>8 ~q2 }
  \mark \markup \bold 3x
  r4  <f c' es bes'>4 -. r8  <f c' des as'>8 -. r8  <f c' es bes'>8  |
  R1 | \bar "||" \break \B
  \repeat volta 2 {
    r4  <d' f b>4 r8  <e bes'>4  < c es a>8 ~ | 
    q4.  <a c fis>8 ~ <a c fis>2 |
    r8  <d as'>4 r8  <e bes'>4 r4 | 
    r4  <bes c f>4 ~ q8  q4. | 
    <as ces f>2  <as c e>4.  <bes es f>8 ~ |
    q8  <a es' g>4  <as d f>8 ~ q2 |
  }
  \alternative {
    { <des f as>2 r8  <des es g>4  <c f as>8 ~ | q1 }
    { <as es' f>2. r8  <as d f>8 ~ | q4. r8 r4  <c f as>4 }
  } \break  \bar "||" \C
  <ces f as >4  q r4.  <des f bes >8 ~ | 
  q1 |
  <a des es as>4 r4 r4.  <bes des g>8 ~ -\fp -\< | 
  q1 | 
  <as ces f>4 -\! -\f  q  <bes e g>4 r4 | 
  r8  des4 f8 ~  f8  g4 as8 ~ | 
  as8  bes4  b8 ~  b8  bes8  b8  <e, bes' c>8 ~ |
  | q1 \break \bar "||" \B
  r4 \mf <d f b>4 r8  <e bes'>4  < c es a>8 ~ | 
  q4.  <a c fis>8 ~ <a c fis>2 |
  r8  <d as'>4 r8  <e bes'>4 r4 | 
  r4  <bes c f>4 ~ q8  q4. | 
  <as ces f>2  <as c e>4.  <bes es f>8 ~ |
  q8  <a es' g>4  <as d f>8 ~ q2 |  
  <as des f ces' >4  q  r8 <as c e bes>4-. <as d f c'>8 -^ |
  \once \override Score.RehearsalMark.extra-offset = #'(4.5 . 1)
  R1 \bar ".."
  \once \override Score.RehearsalMark #'self-alignment-X = #RIGHT
  \once \override Score.RehearsalMark #'direction = #DOWN
  \once \override Score.RehearsalMark #'self-alignment-X = #RIGHT
  \once \override Score.RehearsalMark.extra-offset = #'(1 . -1)
  \mark \markup  \with-color #red \fontsize #2 "Solos on ABBCB then D.C."
}

PianoDir =  \relative c {
  \clef "treble_8" \key as \major \time 4/4
  \set Staff.instrumentName =\markup {
    \center-column { "Piano or"
                     \line { "Guit." }
    }
  }
  \set Staff.shortInstrumentName = "P / G"
  \override Rest.staff-position = #0
  \override MultiMeasureRest.staff-position = #0
  \showStartRepeatBar \bar "[|:"
  r4 \mf <f c' es bes'>4 -. r8  <f c' des as'>8 -. r8  <f c' es bes'>8 ~ |
  q4.  <f c' des as'>8 ~q2 
  r4  <f c' es bes'>4 -. r8  <f c' des as'>8 -. r8  <f c' es bes'>8 |
  R1 | 
  r4 \mf  <d' f b>4 r8  <e bes'>4  < c es a>8 ~ | 
  q4.  <a c fis>8 ~ <a c fis>2 |
  r8  <d as'>4 r8  <e bes'>4 r4 | 
  r4  <bes c f>4 ~ q8  q4. | 
  <as ces f>2  <as c e>4.  <bes es f>8 ~ |
  q8  <a es' g>4  <as d f>8 ~ q2 |
  <des f as>2 r8  <des es g>4  <c f as>8 ~ |
  q1 |
  r4  <d f b>4 r8  <e bes'>4  < c es a>8 ~ | 
  q4.  <a c fis>8 ~ <a c fis>2 |
  r8  <d as'>4 r8  <e bes'>4 r4 | 
  r4  <bes c f>4 ~ q8  q4. | 
  <as ces f>2  <as c e>4.  <bes es f>8 ~ |
  q8  <a es' g>4  <as d f>8 ~ q2 |  
  <as es' f>2. r8  <as d f>8 ~ | 
  q4. r8 r4  <c f as>4
  <ces f as >4  q r4.  <des f bes >8 ~ | 
  q1 |
  <a des es as>4 r4 r4.  <bes des g>8 ~ -\fp -\< | 
  q1 | 
  <as ces f>4 -\! -\f  q  <bes e g>4 r4 | 
  r8  des4  f8 ~  f8  g4 as8 ~ | 
  as8  bes4  b8 ~  b8  bes8  b8  <e, bes' c>8 ~ |
  | q1
  r4  <d f b>4 \mf r8  <e bes'>4  < c es a>8 ~ | 
  q4.  <a c fis>8 ~ <a c fis>2 |
  r8  <d as'>4 r8  <e bes'>4 r4 | 
  r4  <bes c f>4 ~ q8  q4. | 
  <as ces f>2  <as c e>4.  <bes es f>8 ~ |
  q8  <a es' g>4  <as d f>8 ~ q2 |
  <as des f ces' >4  q  r8 <as c e bes>4-. <as d f c'>8 -^ | 
  R1 
}


Basse =  \relative c, {
  \key as \major \time 4/4
  \showStartRepeatBar \bar "[|:"
  \override Rest.staff-position = #0
  \override MultiMeasureRest.staff-position = #0
  \mark \markup { \bold \box \fontsize #2 A \with-color #red { "Solo cont. on " \box A" last x" }  }
  \repeat volta 3 {
    f4.  c'8  es8  f8  c8  f,8 ~ | f4.  c'8 r8  c8  es8  f8 }
  \mark \markup \bold 3x
  f,4.  c'8  es8  f8  c8 
  f,8 | % 8
  R1 | \bar "||" \break \B
  \repeat volta 2 {
    g'4 r8  c,8 ~  c8  as'8 
    c8  f,8 ~ |
    f8  e8  es8  d8 ~  d2 | % 11
    r8  e,8  bes'8  e8  fis8  cis8
    fis,8  f8 ~ | % 12
    f4. r8  e4 -.  f4 | \break
    des'4  as'4  c,4.  f8 ~ | % 14
    f8  b,4  bes8 ~  bes2 | % 15
  }
  \alternative {
    {  es2 r8  bes'4  as8 ~ | as4.  es8  es2 }
    { b4.  b8  b8  b4  bes8 ~ | bes4.  bes8  bes2 | \bar "||" }
  }
  \break \C
  des4  des4 r4.  ges,8 ~ | % 26
  ges1 | % 27
  f'4 r4 r4.  es8 ~ | % 28
  es1 | 
  des4  des4  c4 r8  bes8 ~ |
  bes4.  a8 ~  a4.  as8 ~ | % 31
  as4.  g8 ~  g4.  c8~ |  1 | 
  \bar "||" \break \B
  g'4 r8  c,8 ~  c8  as'8 
  c8  f,8 ~ | % 34
  f8  e8  es8  d8 ~  d2 | % 35
  r8  e,8  bes'8  e8  fis8  cis8
  fis,8  f8 ~ | % 36
  f4. r8  e4 -.  f4 | 
  des'4  as'4  c,4.  f8 ~ | % 38
  f8  b,4  bes8 ~  bes2 | % 39
  des4  des4 r8 c4-. f8 -^ |
  \once \override Score.RehearsalMark.extra-offset = #'(4.5 . 1)
  R1 \bar ".."
  \once \override Score.RehearsalMark #'self-alignment-X = #RIGHT
  \once \override Score.RehearsalMark #'direction = #DOWN
  \once \override Score.RehearsalMark #'self-alignment-X = #RIGHT
  \once \override Score.RehearsalMark.extra-offset = #'(1 . -1)
  \mark \markup  \with-color #red \fontsize #2 "Solos on ABBCB then D.C."
}

BasseDir =  \relative c, {
  \clef "bass" \key as \major \time 4/4
  \set Staff.instrumentName ="Basse"
  \showStartRepeatBar \bar "[|:"
  \override Rest.staff-position = #0
  \override MultiMeasureRest.staff-position = #0
  \set Staff.instrumentName ="Bass"
  \set Staff.shortInstrumentName = "Bass"
  f4.  c'8  es8  f8  c8  f,8 ~ | f4.  c'8 r8  c8  es8  f8 
  f,4.  c'8  es8  f8  c8 
  f,8 | % 8
  R1 |
  g'4 r8  c,8 ~  c8  as'8 
  c8  f,8 ~ |
  f8  e8  es8  d8 ~  d2 | % 11
  r8  e,8  bes'8  e8  fis8  cis8
  fis,8  f8 ~ | % 12
  f4. r8  e4 -.  f4 | 
  des'4  as'4  c,4.  f8 ~ | % 14
  f8  b,4  bes8 ~  bes2 | % 15
  es2 r8  bes'4  as8 ~ | % 16
  as4.  es8  es2 |  
  g4 r8  c,8 ~  c8  as'8  c8
  f,8 ~ | % 18
  f8  e8  es8  d8 ~  d2
  | % 19
  r8  e,8  bes'8  e8  fis8  cis8
  fis,8  f8 ~ |
  f4. r8  e4 -.  f4 | 
  des'4  as'4  c,4.  f8 ~ | % 22
  f8  b,4  bes8 ~  bes2 | % 23
  b4.  b8  b8  b4  bes8 ~ | % 24
  bes4.  bes8  bes2 
  des4  des4 r4.  ges,8 ~ | % 26
  ges1 | % 27
  f'4 r4 r4.  es8 ~ | % 28
  es1 | 
  des4  des4  c4 r8  bes8 ~ |
  bes4.  a8 ~  a4.  as8 ~ | % 31
  as4.  g8 ~  g4.  c8~ |  1 | 
  g'4 r8  c,8 ~  c8  as'8 
  c8  f,8 ~ | % 34
  f8  e8  es8  d8 ~  d2 | % 35
  r8  e,8  bes'8  e8  fis8  cis8
  fis,8  f8 ~ | % 36
  f4. r8  e4 -.  f4 | % 37
  des'4  as'4  c,4.  f8 ~ | % 38
  f8  b,4  bes8 ~  bes2 | % 39
  des4  des4 r8 c4-. f8 -^ |
  R1 
}


\book {
  \paper {
    #(set-paper-size "a4")
    first-page-number =#0
  }
  #(define output-suffix "Ca4")
  \bookpart {
    \paper {
      print-page-number = ##f
    }   
    \markup {
      \column {      
        \vspace #5
        \fill-line { \fontsize #9 "213 Cha Cha" }
        \fill-line { "Music Sheet for Combo" }
        \vspace #2
        \fontsize #4 {
          \fill-line { \circle \bold \concat {" " \musicglyph #"clefs.G_change" " "} }
          \fill-line { "C version" } 
        }
        \vspace #2      
        \fontsize #4 {
          \page-link #2 \line  {  \hspace #10 \underline { Full Score } }
          \vspace #0.3
          \page-link #5 \line  {  \hspace #10 \underline { Horn I \fontsize #-2 "(alto sax)" } }
          \vspace #0.3
          \page-link #6 \line  {  \hspace #10 \underline { Horn II \fontsize #-2 "(Flugelhorn)" } }
          \vspace #0.3
          \page-link #7 \line  {  \hspace #10 \underline { Horn III \fontsize #-2 "(Trombone)" } }
          \vspace #0.3
          \page-link #8 \line  {  \hspace #10 \underline { Rhythm section \fontsize #-2 "(Piano and Bass)" } }
        }
        \vspace #3
        \override #'(line-width . 120)
        \fontsize #2 \fill-line { " " "Lilypond sources embeded in pdf file" }
      }
    }
  }
  \bookpart {
    \paper { 
      oddFooterMarkup = \markup \small { \fill-line { \line { \concat { "213 Cha Cha (David Torres) - C version - Full Score" } } } }
      print-page-number = ##t
    }
    \score {
      <<
        \new StaffGroup << 
          \new Staff \with { shortInstrumentName = "H.1" midiInstrument = "alto sax" } 
          << 
            \new Voice = "Mel" { \theNotesI } 
            \new Voice = "ctrl" { \ossature }
          >> 
          \new Staff \with { shortInstrumentName = "H.2" midiInstrument = "trumpet"} 
          << \new Voice = "Mel" { \theNotesII } >> 
          \new Staff \with { shortInstrumentName = "H.3" midiInstrument = "trombone"} 
          << \new Voice = "Mel" { \clef "bass" \theNotesIII } >>   
        >>     
        \new Staff \with { shortInstrumentName = "P / G" midiInstrument = "electric guitar (jazz)"} 
        << \new Voice = "Mel" { \PianoDir } >> 
        \new ChordNames \with { \override VerticalAxisGroup.staff-affinity = #CENTER }
        { \harmonies }
        \new Staff \with { shortInstrumentName = "Bass" midiInstrument = "electric bass (finger)"} 
        << \new Voice = "Mel" { \BasseDir } >> 
      >>
      \layout {
        \context { 
          \Score
          \revert KeySignature #'break-visibility
          \revert Clef #'break-visibility
      } }
      \midi {
        \context {
          \Score
          tempoWholesPerMinute = #(ly:make-moment 132 4)
        }
        \context {
          \ChordNames
          \remove "Staff_performer"
        }
      }
  } }
  \bookpart {
    \paper { 
      oddFooterMarkup = \markup \small { \fill-line { \line { \concat { "213 Cha Cha (David Torres) - C version - Horn 1" } } } }
    }
    \header { meter = \markup \pad-around #4 \circle \fontsize #2 { \pad-around #1 \bold \concat {C \raise #-1 K} } }
    \score {
      <<
        \new ChordNames { \harmonies }
        \new Staff
        <<
          \new Voice = "Mel" { \theNotesI }
          \new Voice = "ctrl" { \ossature }
        >> 
      >>
  } }
  \bookpart {
    \paper { 
      oddFooterMarkup = \markup \small { \fill-line { \line { \concat { "213 Cha Cha (David Torres) - C version - Horn 2" } } } }
    }
    \header { meter = \markup \pad-around #4 \circle \fontsize #2 { \pad-around #1 \bold \concat {C \raise #-1 K} } }
    \score {
      <<
        \new ChordNames { \harmonies }
        \new Staff
        <<
          \new Voice = "Mel" { \theNotesII }
          \new Voice = "ctrl" { \ossature }
        >> 
      >>
  } }
  \bookpart {
    \paper { 
      oddFooterMarkup = \markup \small { \fill-line { \line { \concat { "213 Cha Cha (David Torres) - C version - Horn 3" } } } }
    }
    \header { meter = \markup \pad-around #4 \circle \fontsize #2 { \pad-around #1 \bold \concat {C \raise #-1 K} } }
    \score {
      <<
        \new ChordNames { \harmonies }
        \new Staff
        <<
          \new Voice = "Mel" { \clef "bass" \theNotesIII }
          \new Voice = "ctrl" { \ossature }
        >> 
      >>
  } } 
  \bookpart {
    \paper { 
      oddFooterMarkup = \markup \small { \fill-line { \line { \concat { "213 Cha Cha (David Torres) - C version - Rhythm Section" } } } }
     page-count = #1
      }
     \header { meter = \markup \pad-around #4 \circle \fontsize #2 { \pad-around #1 \bold \concat {C \raise #-1 K} } }
    \score {
      <<
        \new Staff \with { instrumentName = "Piano" shortInstrumentName = "P." } 
        <<
          \new Voice = "Mel" { << \Piano >> }
        >>         
        \new ChordNames { \harmoniesR }
        \new Staff \with { instrumentName = "Bass" shortInstrumentName = "B." } 
        <<
          \new Voice = "Mel" { << \clef "bass" \Basse \\ { s1*18 \break s1*8 \break } >> }
        >> 
      >> 
} } }


\book {
  \paper {
    #(set-paper-size "a4")
    first-page-number =#0
  }
  #(define output-suffix "Bba4")
  \bookpart {
    \paper {
      print-page-number = ##f
    }   
    \markup {
      \column {      
        \vspace #5
        \fill-line { \fontsize #9 "213 Cha Cha" }
        \fill-line { "Music Sheet for Combo" }
        \vspace #2
        \fontsize #4 {
          \fill-line { \pad-around #2 \fontsize #3 \circle \bold \concat {" " B  \flat " "} }
          \fill-line { \concat {B \small \flat " Version"} }
        }
        \vspace #2      
        \fontsize #4 {
          \page-link #2 \line  {  \hspace #10 \underline { Horn I \fontsize #-2 "(alto sax)" } }
          \vspace #0.3
          \page-link #3  \line  {  \hspace #10 \underline { Horn II \fontsize #-2 "(Flugelhorn)" } }
          \vspace #0.3
          \page-link #4  \line  {  \hspace #10 \underline { Horn III \fontsize #-2 "(Trombone)" } }
          \vspace #0.3
          \page-link #5 \line  {  \hspace #10 \underline { Bass \fontsize #-2 \concat{ "(for B" \small \flat " Wind Bass)" } } }
        }
        \vspace #3
        \override #'(line-width . 120)
        \fontsize #2 \fill-line { " " "Lilypond sources embeded in pdf file" }
      }
    }
  }
  \bookpart {
    \header { meter = \markup \pad-around #4 \circle \bold \concat {" " B  \flat " "} }
    \paper { 
      oddFooterMarkup = \markup \small { \fill-line { \line { \concat { "213 Cha Cha (David Torres) - B"\flat" version - Horn 1" } } } }
    }
    \score {
      <<
        \new ChordNames { \transpose c d \harmonies }
        \new Staff
        <<
          \new Voice = "Mel" { \transpose c d \theNotesI }
          \new Voice = "ctrl" { \ossature }
        >> 
      >>
  } }
  \bookpart {
    \header { meter = \markup \pad-around #4 \circle \bold \concat {" " B  \flat " "} }
    \paper { 
      oddFooterMarkup = \markup \small { \fill-line { \line { \concat { "213 Cha Cha (David Torres) - B"\flat" version - Horn 2" } } } }
    }
    \score {
      <<
        \new ChordNames { \transpose c d \harmonies }
        \new Staff
        <<
          \new Voice = "Mel" { \transpose c d \theNotesII }
          \new Voice = "ctrl" { \ossature }
        >> 
      >>
  } }
  \bookpart {
    \header { meter = \markup \pad-around #4 \circle \bold \concat {" " B  \flat " "} }
    \paper { 
      oddFooterMarkup = \markup \small { \fill-line { \line { \concat { "213 Cha Cha (David Torres) - B"\flat" version - Horn 3" } } } }
    }
    \score {
      <<
        \new ChordNames { \transpose c d \harmonies }
        \new Staff
        <<
          \new Voice = "Mel" { \transpose c d' \theNotesIII }
          \new Voice = "ctrl" { \ossature }
        >> 
      >>
  } } 
  \bookpart {
    \header { meter = \markup \pad-around #4 \circle \bold \concat {" " B  \flat " "} }
    \paper { 
      oddFooterMarkup = \markup \small { \fill-line { \line { \concat { "213 Cha Cha (David Torres) - B"\flat" version - Wind Bass" } } } }
    }
    \score {
      <<
        \new ChordNames { \transpose c d \harmoniesR }
        \new Staff \with { instrumentName = \markup { \center-column { "Wind" \line { "Bass" } } } } 
        <<
          \new Voice = "Mel" { << \transpose c d'' \Basse \\ { s1*18 \break s1*8 \break } >> }
        >> 
      >> 
} } }

\book {
  \paper {
    #(set-paper-size "a4")
    first-page-number =#0
  }
  #(define output-suffix "Eba4")
  \bookpart {
    \paper {
      print-page-number = ##f
    }   
    \markup {
      \column {      
        \vspace #5
        \fill-line { \fontsize #9 "213 Cha Cha" }
        \fill-line { "Music Sheet for Combo" }
        \vspace #2
        \fontsize #4 {
          \fill-line { \pad-around #2 \fontsize #3 \circle \bold \concat {" " E  \flat " "} }
          \fill-line { \concat {E \small \flat " Version"} }
        }
        \vspace #2      
        \fontsize #4 {
          \page-link #2 \line  {  \hspace #10 \underline { Horn I \fontsize #-2 "(alto sax)" } }
          \vspace #0.3
          \page-link #3 \line  {  \hspace #10 \underline { Horn II \fontsize #-2 "(Flugelhorn)" } }
          \vspace #0.3
          \page-link #4 \line  {  \hspace #10 \underline { Horn III \fontsize #-2 "(Trombone)" } }
          \vspace #0.3
          \page-link #5 \line  {  \hspace #10 \underline { Bass \fontsize #-2 \concat{ "(for B" \small \flat " Wind Bass)" } } }
        }
        \vspace #3
        \override #'(line-width . 120)
        \fontsize #2 \fill-line { " " "Lilypond sources embeded in pdf file" }
      }
    }
  }
  \bookpart {
    \header { meter = \markup \pad-around #4 \circle \bold \concat {" " E  \flat " "} }
    \paper { 
      oddFooterMarkup = \markup \small { \fill-line { \line { \concat { "213 Cha Cha (David Torres) - E"\flat" version - Horn 1" } } } }
    }
    \score {
      <<
        \new ChordNames { \transpose c a \harmonies }
        \new Staff
        <<
          \new Voice = "Mel" { \transpose c a \theNotesI }
          \new Voice = "ctrl" { \ossature }
        >> 
      >>
  } }
  \bookpart {
    \header { meter = \markup \pad-around #4 \circle \bold \concat {" " E  \flat " "} }
    \paper { 
      oddFooterMarkup = \markup \small { \fill-line { \line { \concat { "213 Cha Cha (David Torres) - E"\flat" version - Horn 2" } } } }
    }
    \score {
      <<
        \new ChordNames { \transpose c a \harmonies }
        \new Staff
        <<
          \new Voice = "Mel" { \transpose c a \theNotesII }
          \new Voice = "ctrl" { \ossature }
        >> 
      >>
  } }
  \bookpart {
    \header { meter = \markup \pad-around #4 \circle \bold \concat {" " E  \flat " "} }
    \paper { 
      oddFooterMarkup = \markup \small { \fill-line { \line { \concat { "213 Cha Cha (David Torres) - E"\flat" version - Horn 3" } } } }
    }
    \score {
      <<
        \new ChordNames { \transpose c a \harmonies }
        \new Staff
        <<
          \new Voice = "Mel" { \transpose c a \theNotesIII }
          \new Voice = "ctrl" { \ossature }
        >> 
      >>
  } } 
  \bookpart {
    \paper { 
      oddFooterMarkup = \markup \small { \fill-line { \line { \concat { "213 Cha Cha (David Torres) - E"\flat" version - Wind Bass" } } } }
    }
    \header { meter = \markup \pad-around #4 \circle \bold \concat {" " E  \flat " "} }
    \score {
      <<
        \new ChordNames { \transpose c a \harmoniesR }
        \new Staff \with { instrumentName = \markup { \center-column { "Wind" \line { "Bass" } } } }
        <<
          \new Voice = "Mel" { << \transpose c a' \Basse \\ { s1*18 \break s1*8 \break } >> }
        >> 
      >> 
  } }
}












\book {
  \paper {
    #(set-paper-size "tablette")
    first-page-number =#0
  }
  #(define output-suffix "CTab")
  \bookpart {
    \paper {
      print-page-number = ##f
    }   
    \markup {
      \column {      
        \vspace #5
        \fill-line { \fontsize #9 "213 Cha Cha" }
        \fill-line { "Music Sheet for Combo" }
        \vspace #2
        \fontsize #4 {
          \fill-line { \circle \bold \concat {" " \musicglyph #"clefs.G_change" " "} }
          \fill-line { "C version" } 
        }
        \vspace #2      
        \fontsize #4 {
          \page-link #2 \line  {  \hspace #10 \underline { Horn I \fontsize #-2 "(alto sax)" } }  
          \vspace #0.3
          \page-link #4 \line  {  \hspace #10 \underline { Horn II \fontsize #-2 "(Flugelhorn)" } }
          \vspace #0.3
          \page-link #6 \line  {  \hspace #10 \underline { Horn III \fontsize #-2 "(Trombone)" } }
          \vspace #0.3
          \page-link #8 \line  {  \hspace #10 \underline { Rhythm section \fontsize #-2 "(Piano and Bass)" } }
        }
        \vspace #3
        \override #'(line-width . 120)
        \fontsize #2 \fill-line { " " "Lilypond sources embeded in pdf file" }
      }
    }
  }
  \bookpart {
    \paper { page-count = #2 }    
    \header { poet = \markup \with-color #red "2 pages score"
      meter = \markup  { \pad-around #3 \circle \fontsize #1 { \pad-around #1 \bold \concat {C \raise #-1 K} } } } 
    \score {
      <<
        \new ChordNames { \harmonies }
        \new Staff 
        <<
          \new Voice = "Mel" { \theNotesI }
          \new Voice = "ctrl" { \ossatureTab }
        >> 
      >>
  } }
  \bookpart {
    \paper { page-count = #2 }    
    \header { poet = \markup \with-color #red "2 pages score"
      meter = \markup  { \pad-around #3 \circle \fontsize #1 { \pad-around #1 \bold \concat {C \raise #-1 K} } } } 
    \score {
      <<
        \new ChordNames { \harmonies }
        \new Staff 
        <<
          \new Voice = "Mel" { \theNotesII }
          \new Voice = "ctrl" { \ossatureTab }
        >> 
      >>
  } }
  \bookpart {
    \paper { page-count = #2 }    
    \header { poet = \markup \with-color #red "2 pages score"
      meter = \markup  { \pad-around #3 \circle \fontsize #1 { \pad-around #1 \bold \concat {C \raise #-1 K} } } } 
    \score {
      <<
        \new ChordNames { \harmonies }
        \new Staff 
        <<
          \new Voice = "Mel" { \clef "bass" \theNotesIII }
          \new Voice = "ctrl" { \ossatureTab }
        >> 
      >>
} } 
  \bookpart {
    \paper { page-count = #2 }    
    \header { poet = \markup \with-color #red "2 pages score"
      meter = \markup  { \hspace #2 \circle \fontsize #1 { \pad-around #1 \bold \concat {C \raise #-1 K} } } } 
    \score {
      <<
        \new Staff \with { instrumentName = "Piano" shortInstrumentName = "P." } 
        <<
          \new Voice = "Mel" { << \Piano >> }
        >>         
        \new ChordNames { \harmoniesR }
        \new Staff \with { instrumentName = "Bass" shortInstrumentName = "B." } 
        <<
          \new Voice = "Mel" { << \clef "bass" \Basse \\ { \autoPageBreaksOff s1*4 \break s1*4 \break s1*6 \pageBreak  s1*4 \break s1*4 \break
          s1*4 \break s1*3 s1 ^\markup \with-color #red \fontsize #2 \pad-around #3 "Solo Break"  } >> }
        >> 
      >> 
  } } }

\book {
  #(define output-suffix "BbTab")
  \paper {
    #(set-paper-size "tablette")
    first-page-number =#0
  }

  \bookpart {
    \paper {
      print-page-number = ##f
    }   
    \markup {
      \column {      
        \vspace #5
        \fill-line { \fontsize #9 "213 Cha Cha" }
        \fill-line { "Music Sheet for Combo" }
        \vspace #2
        \fontsize #4 {
          \fill-line { \pad-around #2 \fontsize #3 \circle \bold \concat {" " B  \flat " "} }
          \fill-line { \concat {B \small \flat " Version"} }
        }
        \vspace #2      
        \fontsize #4 {
          \page-link #2 \line  {  \hspace #10 \underline { Horn I \fontsize #-2 "(alto sax)" } }
          \vspace #0.3
          \page-link #4  \line  {  \hspace #10 \underline { Horn II \fontsize #-2 "(Flugelhorn)" } }
          \vspace #0.3
          \page-link #6  \line  {  \hspace #10 \underline { Horn III \fontsize #-2 "(Trombone)" } }
          \vspace #0.3
          \page-link #8 \line  {  \hspace #10 \underline { Bass \fontsize #-2 \concat{ "(for B" \small \flat " Wind Bass)" } } }
        }
        \vspace #2
        \override #'(line-width . 120)
        \fontsize #2 \fill-line { " " "Lilypond sources embeded in pdf file" }
      }
    }
  }

  \bookpart {
    \header { poet = \markup \with-color #red "2 pages score"
      meter = \markup { \pad-around #3 \circle \bold \concat {" " B  \flat " "} } }  
    \paper { page-count = #2 }    
    \score {
      <<
        \new ChordNames { \transpose c d \harmonies }
        \new Staff
        <<
          \new Voice = "Mel" { \transpose c d \theNotesI }
          \new Voice = "ctrl" { \ossatureTab }
        >> 
      >>
  } }
  \bookpart {
    \header { poet = \markup \with-color #red "2 pages score"
      meter = \markup { \pad-around #3 \circle \bold \concat {" " B  \flat " "} } }  
    \paper { page-count = #2 }    
    \score {
      <<
        \new ChordNames { \transpose c d \harmonies }
        \new Staff
        <<
          \new Voice = "Mel" { \transpose c d \theNotesII }
          \new Voice = "ctrl" { \ossatureTab }
        >> 
      >>
  } }
  \bookpart {
    \header { poet = \markup \with-color #red "2 pages score"
      meter = \markup { \pad-around #3 \circle \bold \concat {" " B  \flat " "} } }  
    \paper { page-count = #2 }    
    \score {
      <<
        \new ChordNames { \transpose c d \harmonies }
        \new Staff
        <<
          \new Voice = "Mel" { \clef "treble_8" \transpose c d \theNotesIII }
          \new Voice = "ctrl" { \ossatureTab }
        >> 
      >>
  } } 
  \bookpart {
    \header { poet = \markup \with-color #red "2 pages score"
      meter = \markup { \pad-around #3 \circle \bold \concat {" " B  \flat " "} } }  
    \paper { page-count = #2 }    
    \score {
      <<
        \new ChordNames { \transpose c d \harmoniesR }
        \new Staff \with { instrumentName = \markup { \center-column { "Wind" \line {"Bass"} }  } } 
        <<
          \new Voice = "Mel" {  \transpose c d'' \Basse }
          \new Voice = "ctrl" { \autoPageBreaksOff s1*4 \break s1*4 \break s1*6 \break s1*4 \break s1*4 \pageBreak
                                s1*4 \break s1*3 s1 ^\markup \with-color #red \fontsize #2 "Solo Break"  }
        >> 
      >> 
  } } }

\book {
  \paper {
    #(set-paper-size "tablette")
    first-page-number =#0
  }
  #(define output-suffix "EbTab")
  \bookpart {
    \paper {
      print-page-number = ##f
    }   
    \markup {
      \column {      
        \vspace #5
        \fill-line { \fontsize #9 "213 Cha Cha" }
        \fill-line { "Music Sheet for Combo" }
        \vspace #2
        \fontsize #4 {
          \fill-line { \pad-around #2 \fontsize #3 \circle \bold \concat {" " E  \flat " "} }
          \fill-line { \concat {E \small \flat " Version"} }
        }
        \vspace #2      
        \fontsize #4 {
          \page-link #2 \line  {  \hspace #10 \underline { Horn I \fontsize #-2 "(alto sax)" } }
          \vspace #0.3
          \page-link #4  \line  {  \hspace #10 \underline { Horn II \fontsize #-2 "(Flugelhorn)" } }
          \vspace #0.3
          \page-link #6  \line  {  \hspace #10 \underline { Horn III \fontsize #-2 "(Trombone)" } }
          \vspace #0.3
          \page-link #8 \line  {  \hspace #10 \underline { Bass \fontsize #-2 \concat{ "(for B" \small \flat " Wind Bass)" } } }
        }
        \vspace #3
        \override #'(line-width . 120)
        \fontsize #2 \fill-line { " " "Lilypond sources embeded in pdf file" }
      }
    }
  }
  \bookpart {
    \header { poet = \markup \with-color #red "2 pages score"
      meter = \markup { \pad-around #3 \circle \bold \concat {" " E  \flat " "} } }  
    \paper { page-count = #2 }    
    \score {
      <<
        \new ChordNames { \transpose c a \harmonies }
        \new Staff 
        <<
          \new Voice = "Mel" { \transpose c a \theNotesI }
          \new Voice = "ctrl" { \ossatureTab }
        >> 
      >>
  } }
  \bookpart {
    \header { poet = \markup \with-color #red "2 pages score"
      meter = \markup { \pad-around #3 \circle \bold \concat {" " E  \flat " "} } }  
    \paper { page-count = #2 }    
    \score {
      <<
        \new ChordNames { \transpose c a \harmonies }
        \new Staff 
        <<
          \new Voice = "Mel" { \transpose c a \theNotesII }
          \new Voice = "ctrl" { \ossatureTab }
        >> 
      >>
  } }
  \bookpart {
    \header { poet = \markup \with-color #red "2 pages score"
      meter = \markup { \pad-around #3 \circle \bold \concat {" " E  \flat " "} } }  
    \paper { page-count = #2 }    
    \score {
      <<
        \new ChordNames { \transpose c a \harmonies }
        \new Staff 
        <<
          \new Voice = "Mel" { \transpose c a' \theNotesIII }
          \new Voice = "ctrl" { \ossatureTab }
        >> 
      >>
} } 
  \bookpart {
    \header { poet = \markup \with-color #red "2 pages score"
      meter = \markup { \pad-around #3 \circle \bold \concat {" " E  \flat " "} } }  
    \paper { page-count = #2 }    
    \score {
      <<
        \new ChordNames { \transpose c a \harmoniesR }
        \new Staff \with { instrumentName = "Wind Bass" } 
        <<
          \new Voice = "Mel" { \transpose c a' \Basse }
          \new Voice = "ctrl" { \autoPageBreaksOff s1*4 \break s1*4 \break s1*6 \break s1*4 \break s1*4 \pageBreak
                                s1*4 \break s1*3 s1 ^\markup \with-color #red \fontsize #2 "Solo Break"  }
        >> 
      >> 
  } } }