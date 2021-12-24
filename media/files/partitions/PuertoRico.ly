\version "2.22.1"
#(set-global-staff-size 17)
\include "double-mark.ly"
\include "AdditionalFunctions.ly"
\include "VariablesJazz.ly"
\include "jazzchords.ily"
\include "lilyjazz.ily"



\paper {
  indent = 0\mm
  ragged-last-bottom = ##t
  ragged-bottom = ##f
  ragged-last = ##f
  markup-system-spacing = #'((basic-distance . 23)
                             (minimum-distance . 15)
                             (padding . 3))
  score-system-spacing = #'((basic-distance . 23)
                            (minimum-distance . 20)
                            (padding . 5))
  system-system-spacing = #'((basic-distance . 15)
                             (minimum-distance . 12)
                             (padding . 2))
}

title = #"Puerto Rico"
composer = #"Antonio Hart"
meter = #"(Med. Latin)"
kwtempo = #"Medium"
kwstyle = #"Latin"

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
  asplayed = #"Antonio Hart" % doit être commentée si vide
  url = #"https://www.youtube.com/watch?v=SvFoPeqYNlY"
  arranger = \markup \on-the-fly #played?
  \with-url #url
  \with-color #blue \underline
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
    \override MultiMeasureRest #'expand-limit = #2
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
  \context { \Score markFormatter = #format-mark-box-alphabet }
  %   \context { \RemoveEmptyStaffContext 				% ne pas imprimer les lignes vides (autres que la première)
  %              \override VerticalAxisGroup #'remove-first = ##t			% Concerne la première ligne
  %   }
}

Accords = \chordmode {
  \set chordChanges = ##t
  g2:m c:m7 a:m5-7 d:7 g2:m c:m7 a:m5-7 d:7
  s1*19
  g2:m c:m7 a:m5-7 d:7 g2:m c:m7 a:m5-7 d:7
  g2:m c:m7 a:m5-7 d:7 g2:m c:m7 a:m5-7 d:7
  
  bes1*4:m7
}

Trompette =  \relative e'' {
  \clef "treble" \numericTimeSignature\time 4/4 \key bes \major
  \set Staff.instrumentName = "Trumpett"
  \set Staff.shortInstrumentName = "Tpt"
  \showStartRepeatBar \bar "[|:"
  \mark #1
  \repeat volta 2 
  {  
    d8.  f,16 ~  f8  g16 r  r2 | % 2
    \once \override Score.RehearsalMark #'direction = #DOWN
    \once \override Score.RehearsalMark.extra-offset = #'(-8.5 . 0)
    \mark \markup \smaller "(Rhythm section tacet 1st X)"
    r8.  d16 ~  d  fis8  a16  c8. a16  c8  a16  bes | % 3
    r16  d,  fis  a  es'8. d16 r2 | % 4
    r16  es  d  c  bes8  g16  a r  d,  fis  g a16  c  fis, r 
  } \break
  \doubleMark
  \markup 3X
  \markup \bold \box B
  \inlineMMRN R1*3 | % 16
  r2.  fis'16  g,  bes  c \bar "||" \break \mark #3
  d8.  bes16 ~  bes  g8  c16 ~ c2 | % 18
  \once \override Score.RehearsalMark #'direction = #DOWN
  \once \override Score.RehearsalMark.extra-offset = #'(-14 . 0)
  \mark \markup \smaller { "(Rhythm section continue with "\box \bold A" pattern)" }

  r16  c8.  a8  f  bes4  g8. d16 | % 19
  a'8  bes16  a ~  a2. |
  r2. r16  g  bes  c | \break % 21
  d8.  g16 ~  g  des8 c16 ~  c2 | % 22
  r16  c8.  a8  f  f'4 ~  f8 fes16  es | % 23
  d1 ~ | % 24
  d2 r | \break 
  g8. -.  c,16 r8  d r16  a' g16  f  d  c  a8 | % 26
  d8. -.  c16 r8  d r4  des'16 c8  bes16 ~ | % 27
  bes8.  g16 r4 r2 | % 28
  R1 | \break \mark #4 % 29
  bes,4 ~ \once \omit TupletBracket \times 2/3  { bes8  a  as } g16  bes8  d  g  f16 ~ | 
  f8.  d16  bes8  es16  d ~  d8.  ges,16 ~  ges8  a | % 31
  bes8.. --  a32 ~  a8  a bes8 -- r r4 \break
  \once \override Score.RehearsalMark #'self-alignment-X = #LEFT
  \mark \markup  { { Solos \bold \box E \smaller "(optionnal horn voicing") } }
  \parenthesize g8 r r4 r2 | % 33
  R1
  \once \override Score.RehearsalMark #'direction = #DOWN
  \once \override Score.RehearsalMark.extra-offset = #'(-14 . 0)
  \mark \markup \smaller { "(Rhythm section continue with "\box \bold A" pattern)" }

  R1 | % 35
  r2 r8 \startParenthesis \parenthesize  fis4. | % 36
  g8 -^ \endParenthesis \parenthesize  r r4 r2 | % 37
  R1 
  \once \override Score.RehearsalMark #'direction = #DOWN
  \once \override Score.RehearsalMark.extra-offset = #'(17 . 0)
  \mark \markup \smaller { "(Play" \bold \box D"after each solos)" }
  R1| % 39
  r2 r8  \parenthesize fis4. | \break
  \once \override Score.RehearsalMark #'self-alignment-X = #LEFT
  \mark \markup { { \bold \box F } Solos \smaller "(horns voicing at the end of each solos)" }
  \break
  \repeat volta 2 {
    \key des \major 
    bes,8.  des16 ~  des  f8  ges16
    ~  ges4  f8 r | % 52
    R1 | % 53
    bes,8.  des16 ~  des  f8  ges16
    ~  ges4  f8 r | % 54
    R1 \break
  }

  \repeat volta 2 {
    \mark #7
    bes8.  des16 ~  des  f8
    ges16 ~  ges4  f8 r | % 56
    r8.  bes,16 ~  bes  des8  f16
    ges8  f16  c ~  c
    es8. | % 57
  }
  | % 59
  r16  a8  ges16 ~  ges  es8
  c16  es  f  ges  es
  f8.  bes16 \bar "|."
}

Tenor =  \relative c'' {
  \clef "treble" \numericTimeSignature\time 4/4 \key bes \major
  \set Staff.instrumentName = "Tenor Sax"
  \set Staff.shortInstrumentName = "T.Sx"
  g8.  bes,16 ~  bes8  c16 r r2 | % 2
  r8.  bes16 ~  bes  d8  fis16  a8.
  fis16  a8  fis16  g | % 3
  r16  d  fis  a  fis8.  g16
  r2 | % 4
  r16  es'  d  c  bes8
  g16  a r  c  c
  bes16  a  g  fis r 
  \inlineMMRN R1*3 | % 16
  r2 r4  fis'16  g,  bes  c
  \bar "||"
  d8.  bes16 ~  bes  g8  a16
  ~  a2 | % 18
  r16  c8.  a8  f  bes4  g8.
  d16 | % 19
  d8  es16  d ~  d2. | 
  r2. r16  g  bes  c | % 21
  d8.  g16 ~  g  des8 
  c16 ~  c2 | % 22
  r16  c8.  a8  f  d'4 ~  d8
  fis16  g | % 23
  a1 ~ | % 24
  a2 r | % 25
  g8. -.  c,16 r8  d r16  a'
  g16  f  d  c  a8
  | % 26
  bes8. -.  c16 r8  d r4  des'16
  c8  bes16 ~ | % 27
  bes8.  g16 r4 r2 | % 28
  R1 | % 29
  bes,4 ~ \once \omit TupletBracket
  \times 2/3  {
    bes8  a  as
  }
  g16  bes8  d  g  f16 ~
  | 
  f8.  d16  bes8  es16  d
  ~  d8.  ges,16 ~  ges8  a | % 31
  g8.. --  fis32 ~  fis8  fis  g
  -- r8 r4 \repeat volta 3 {
    | % 32
    \parenthesize d'8 -^ r r4 r2 | % 33
    R1*2 | % 35
    r2 r8  \startParenthesis \parenthesize c4. | % 36
    d8 -^ \endParenthesis \parenthesize  r r4 r2 | % 37
    R1*2 | % 39
    r2 r8  \parenthesize c4. | 
  }
  \repeat volta 2 {
    | % 47
    \key des \major bes,8.  des16 ~  des  f8  ges16
    ~  ges4  f8 r | % 52
    R1 | % 53
    bes,8.  des16 ~  des  f8  ges16
    ~  ges4  f8 r | % 54
    R1
  }
 
  \repeat volta 2 {
    | % 55
    bes8.  des16 ~  des  f8
    ges16 ~  ges4  f8 r | % 56
    r8.  bes,16 ~  bes  des8  f16
    ges8  f16  c ~  c
    es8. | % 57

  }
  | % 59
  r16  a8  ges16 ~  ges  es8
  c16  es  f  ges  es
  f8.  bes16 \bar "|."
}


TrompetteII =  \relative e'' {
  \clef "treble" \numericTimeSignature\time 4/4 \key bes \major
  \set Staff.instrumentName = "Trumpett"
  \set Staff.shortInstrumentName = "Tpt"
  \showStartRepeatBar \bar "[|:"
  \mark #1
  \repeat volta 2 
  {  
    d8.  f,16 ~  f8  g16 r  r2 | % 2
    \once \override Score.RehearsalMark #'direction = #DOWN
    \once \override Score.RehearsalMark.extra-offset = #'(-8.5 . 0)
    \mark \markup \smaller "(Rhythm section tacet 1st X)"
    r8.  d16 ~  d  fis8  a16  c8. a16  c8  a16  bes | % 3
    r16  d,  fis  a  es'8. d16 r2 | % 4
    r16  es  d  c  bes8  g16  a r  d,  fis  g a16  c  fis, r 
  } \break
  \doubleMark
  \markup 3X
  \markup \bold \box B
  \inlineMMRN R1*3 | % 16
  r2.  fis'16  g,  bes  c \bar "||" \break \mark #3
  d8.  bes16 ~  bes  g8  c16 ~ c2 | % 18
  r16  c8.  a8  f  bes4  g8. d16 | % 19
  a'8  bes16  a ~  a2. |
  r2. r16  g  bes  c | \break % 21
  d8.  g16 ~  g  des8 c16 ~  c2 | % 22
  r16  c8.  a8  f  f'4 ~  f8 fes16  es | % 23
  d1 ~ | % 24
  d2 r | \break 
  g,8. -.  c,16 r8  d r16  a' g16  f  d  c  a8 | % 26
  d8. -.  c16 r8  d r4  des16 c8  bes16 ~ | % 27
  bes8.  g16 r4 r2 | % 28
  R1 | \break \mark #4 % 29
  bes'4 ~ \once \omit TupletBracket \times 2/3  { bes8  a  as } g16  bes8  d  g  f16 ~ | 
  f8.  d16  bes8  es16  d ~  d8.  ges,16 ~  ges8  a | % 31
  bes8.. --  a32 ~  a8  a bes8 -- r r4 \break
  \once \override Score.RehearsalMark #'self-alignment-X = #LEFT
  \mark \markup  { { Solos \bold \box E \smaller "(optionnal horn voicing") } }
  \parenthesize g8 r r4 r2 | % 33
  R1
  R1 | % 35
  r2 r8 \startParenthesis \parenthesize  fis4. | % 36
  g8 -^ \endParenthesis \parenthesize  r r4 r2 | % 37
  R1 
  \once \override Score.RehearsalMark #'direction = #DOWN
  \once \override Score.RehearsalMark.extra-offset = #'(17 . 0)
  \mark \markup \smaller { "(Play" \bold \box D"after each solos)" }
  R1| % 39
  r2 r8  \parenthesize fis4. | \break
  \once \override Score.RehearsalMark #'self-alignment-X = #LEFT
  \mark \markup { { \bold \box F } Solos \smaller "(horns voicing at the end of each solos)" }
  \break
  \repeat volta 2 {
    \key des \major 
    bes,8.  des16 ~  des  f8  ges16
    ~  ges4  f8 r | % 52
    R1 | % 53
    bes,8.  des16 ~  des  f8  ges16
    ~  ges4  f8 r | % 54
    R1 \break  }

  \repeat volta 4 {
    bes,8.  des16 ~  des  f8  ges16
    ~  ges4  f8 r | % 52
    R1 | % 53
    bes,8.  des16 ~  des  f8  ges16
    ~  ges4  f8 r | % 54
    R1 \break
  }
  \repeat volta 2 {
    | % 55
    bes,8.  des16 ~  des  f8
    ges16 ~  ges4  f8 r | % 56
    r8.  bes,16 ~  bes  des8  f16
    ges8  f16  c ~  c
    es8. | % 57
  }
  | % 59
  r16  a8  ges16 ~  ges  es8
  c16  es  f  ges  es
  f8.  bes16 \bar "|."
}

TenorII =  \relative c'' {
  \clef "treble" \numericTimeSignature\time 4/4 \key bes \major
  \set Staff.instrumentName = "Tenor Sax"
  \set Staff.shortInstrumentName = "T.Sx"
  g8.  bes,16 ~  bes8  c16 r r2 | % 2
  r8.  bes16 ~  bes  d8  fis16  a8.
  fis16  a8  fis16  g | % 3
  r16  d  fis  a  fis8.  g16
  r2 | % 4
  r16  es'  d  c  bes8
  g16  a r  c  c
  bes16  a  g  fis r 
  \inlineMMRN R1*3 | % 16
  r2 r4  fis'16  g,  bes  c
  \bar "||"
  d8.  bes16 ~  bes  g8  a16
  ~  a2 | % 18
  r16  c8.  a8  f  bes4  g8.
  d16 | % 19
  d8  es16  d ~  d2. | 
  r2. r16  g  bes  c | % 21
  d8.  g16 ~  g  des8 
  c16 ~  c2 | % 22
  r16  c8.  a8  f  d'4 ~  d8
  fis16  g | % 23
  a1 ~ | % 24
  a2 r | % 25
  g,8. -.  c,16 r8  d r16  a'
  g16  f  d  c  a8
  | % 26
  bes8. -.  c16 r8  d r4  des16
  c8  bes16 ~ | % 27
  bes8.  g16 r4 r2 | % 28
  R1 | % 29
  bes'4 ~ \once \omit TupletBracket
  \times 2/3  {
    bes8  a  as
  }
  g16  bes8  d  g  f16 ~
  | 
  f8.  d16  bes8  es16  d
  ~  d8.  ges,16 ~  ges8  a | % 31
  g8.. --  fis32 ~  fis8  fis  g
  -- r8 r4 \repeat volta 3 {
    | % 32
    \parenthesize d'8 -^ r r4 r2 | % 33
    R1*2 | % 35
    r2 r8  \startParenthesis \parenthesize c4. | % 36
    d8 -^ \endParenthesis \parenthesize  r r4 r2 | % 37
    R1*2 | % 39
    r2 r8  \parenthesize c4. | 
  }
  | % 44

  \repeat volta 2 {
    \key des \major
    bes,8.  des16 ~  des  f8  ges16
    ~  ges4  f8 r | % 52
    R1 | % 53
    bes,8.  des16 ~  des  f8  ges16
    ~  ges4  f8 r | % 54
    R1 \break
  }
  \repeat volta 4 {
    | % 51
    bes,8.  des16 ~  des  f8  ges16
    ~  ges4  f8 r | % 52
    R1 | % 53
    bes,8.  des16 ~  des  f8  ges16
    ~  ges4  f8 r | % 54
    R1
  }
  \repeat volta 2 {
    | % 55
    bes,8.  des16 ~  des  f8
    ges16 ~  ges4  f8 r | % 56
    r8.  bes,16 ~  bes  des8  f16
    ges8  f16  c ~  c
    es8. | % 57

  }
  | % 59
  r16  a8  ges16 ~  ges  es8
  c16  es  f  ges  es
  f8.  bes16 \bar "|."
}


Guitare =  \relative g {
  \set Staff.instrumentName = "Guitar"
  \set Staff.shortInstrumentName = "Guit."
  \clef "treble_8" \numericTimeSignature\time 4/4 \key bes \major | % 1
  <g bes d>4  c8  bes  es
  <es, g bes>4  g8 | % 6
  <c, es a>4  bes'8  a  d  <c,
  fis a>4  g'8 | % 7
  <g bes d>4  c8  bes  es
  <es, g bes>4  g8 | % 8
  <c, es a>4  bes'8  a  d  <c,
  fis a>4  g'8 | % 9
  d'8  bes16  g  d'8. 
  es16 ~  es  bes8  g16  es'8.
  g16 ~ | % 14
  g16  es8  c16  g'8. 
  fis16 ~  fis  d8  bes16  fis'8.
  d16 ~ | % 15
  d8  bes16  g  d'8. 
  es16 ~  es  bes8  g16  es'8.
  g16 ~ | % 16
  g16  es8  c16  g'8. 
  fis16 ~  fis  d8  bes16 ~  bes8
  g8 \bar "||"
  % <g bes d>4  c8  bes  es
  %   <es, g bes>4  g8 | % 18
  %   <c, es a>4  bes'8  a  d  <c,
  %   fis a>4  g'8 | % 19
  %   <g bes d>4  c8  bes  es
  %   <es, g bes>4  g8 | 
  %   <c, es a>4  bes'8  a  d  <c,
  %   fis a>4  g'8 |
  s1*8
  % 21
  % <g bes d>4  c8  bes  es
  %   <es, g bes>4  g8 | % 22
  %   <c, es a>4  bes'8  a  d  <c,
  %   fis a>4  g'8 | % 23
  %   <g bes d>4  c8  bes  es
  %   <es, g bes>4  g8 | % 24
  %   <c, es a>4  bes'8  a  d  <c,
  %   fis a>4  g'8 | % 25
  <bes d g>8. -.  <g bes d>16 r8  <es g bes>
  r2 | % 26
  <c' es g>8. -.  <g a es'>16 r8  <d fis a>
  r2 | % 27
  <g bes d>4  c8  bes  es
  <es, g bes>4  g8 | % 28
  <c, es a>4  bes'8  a  d  <c,
  fis a>4  g'8 | % 29
  <g bes d>4  c8  bes  es
  <es, g bes>4  g8 | 
  <c, es a>4  bes'8  a  d  <c,
  fis a>4  g'8 | % 31
  <g bes d g>8.. --  <fis a c d>32 ~ 
  <fis a c d>8  <fis a c d>  <g bes d g> -- r r4
  \repeat volta 3 {
    s1*8
    %     <g bes d>4  c8  bes  es
    %     <es, g bes>4  g8 | % 33
    %     <c, es a>4  bes'8  a  d 
    %     <c, fis a>4  g'8 | % 34
    %     <g bes d>4  c8  bes  es
    %     <es, g bes>4  g8 | % 35
    %     <c, es a>4  bes'8  a  d 
    %     <c, fis a>4  g'8 | % 36
    %     <g bes d>4  c8  bes  es
    %     <es, g bes>4  g8 | % 37
    %     <c, es a>4  bes'8  a  d 
    %     <c, fis a>4  g'8 | % 38
    %     <g bes d>4  c8  bes  es
    %     <es, g bes>4  g8 | % 39
    %     <c, es a>4  bes'8  a  d 
    %     <c, fis a>4  g'8 | 
  }
 
  \key des \major  <des f as bes>4..  <f as des f>16
  ~  <f as des f>2 | % 48
  r8.  <bes des as'>16 ~  <bes des as'>4 ~
  ~  <bes des as'>4  <bes des ges> | % 49
  <des, f as bes>4..  <f as des f>16 ~
  <f as des f>2 | 
  r8.  <bes des as'>16 ~  <bes des as'>4 ~
  ~  <bes des as'>4  <bes des ges>
  \repeat volta 4 {
    %     | % 51
    %     <des, f as bes>4..  <f as des f>16 ~
    %     <f as des f>2 | % 52
    %     r8.  <bes des as'>16 ~  <bes des as'>4 ~
    %     ~  <bes des as'>4  <bes des ges> | % 53
    %     <des, f as bes>4..  <f as des f>16 ~
    %     <f as des f>2 | % 54
    %     r8.  <bes des as'>16 ~  <bes des as'>4 ~
    %     ~  <bes des as'>4  <bes des ges>
  }
  \repeat volta 2 {
    | % 55
    <bes, des f as>4..  <f' as des f>16 ~
    <f as des f>2 | % 56
    r8.  <bes des as'>16 ~  <bes des as'>4
    <bes des ges>4  <bes des f> | % 57
  }
  | % 59
  r16  a'8  ges16 ~  ges  es8 c16  es  f  ges 
  es16  f8.  bes16 \bar "|."
}
Basse =  \relative g {
  \set Staff.instrumentName = "Bass"
  \set Staff.shortInstrumentName = "Bass"
  \clef "bass" \numericTimeSignature\time 4/4 \key bes \major
  \transposition c | % 1
  \times 2/3  {
    g2  bes,4
  }
  \times 2/3  {
    c2  bes4
  }
  | % 6
  \times 2/3  {
    a2  es'4
  }
  \times 2/3  {
    d2  a'4
  }
  | % 7
  \times 2/3  {
    g2  bes,4
  }
  \times 2/3  {
    c2  bes4
  }
  | % 8
  \times 2/3  {
    a2  es'4
  }
  \times 2/3  {
    d2  a'4
  }
  | % 9
  \times 2/3  {
    g2  bes,4
  }
  \times 2/3  {
    c2  bes4
  }
  | % 14
  \times 2/3  {
    a2  es'4
  }
  \times 2/3  {
    d2  a'4
  }
  | % 15
  \times 2/3  {
    g2  bes,4
  }
  \times 2/3  {
    c2  bes4
  }
  | % 16
  \times 2/3  {
    a2  es'4
  }
  \times 2/3  {
    d2  a'4
  }
  \bar "||"
  %  \times 2/3  {
  %     g2  bes,4
  %   }
  %   \times 2/3  {
  %     c2  bes4
  %   }
  %   | % 18
  %   \times 2/3  {
  %     a2  es'4
  %   }
  %   \times 2/3  {
  %     d2  a'4
  %   }
  %   | % 19
  %   \times 2/3  {
  %     g2  bes,4
  %   }
  %   \times 2/3  {
  %     c2  bes4
  %   }
  %   | 
  %   \times 2/3  {
  %     a2  es'4
  %   }
  %   \times 2/3  {
  %     d2  a'4
  %   }
  | % 21
  % \times 2/3  {
  %     g2  bes,4
  %   }
  %   \times 2/3  {
  %     c2  bes4
  %   }
  %   | % 22
  %   \times 2/3  {
  %     a2  es'4
  %   }
  %   \times 2/3  {
  %     d2  a'4
  %   }
  %   | % 23
  %   \times 2/3  {
  %     g2  bes,4
  %   }
  %   \times 2/3  {
  %     c2  bes4
  %   }
  %   | % 24
  %   \times 2/3  {
  %     a2  es'4
  %   }
  %   \times 2/3  {
  %     d2  a'4
  %   }
  s1*8
  | % 25
  g8. -.  bes,16 r8  c r2 | % 26
  es8. -.  c16 r8  d r2 | % 27
  \times 2/3  {
    g2  bes,4
  }
  \times 2/3  {
    c2  bes4
  }
  | % 28
  \times 2/3  {
    a2  es'4
  }
  \times 2/3  {
    d2  a'4
  }
  | % 29
  \times 2/3  {
    g2  bes,4
  }
  \times 2/3  {
    c2  bes4
  }
  | 
  \times 2/3  {
    a2  es'4
  }
  \times 2/3  {
    d2  a'4
  }
  | % 31
  g8.. --  d32 ~  d8  d
  g8 -- r r4 \repeat volta 3 {
    s1*8
    %     | % 32
    %     \times 2/3  {
    %       g2  bes,4
    %     }
    %     \times 2/3  {
    %       c2  bes4
    %     }
    %     | % 33
    %     \times 2/3  {
    %       a2  es'4
    %     }
    %     \times 2/3  {
    %       d2  a'4
    %     }
    %     | % 34
    %     \times 2/3  {
    %       g2  bes,4
    %     }
    %     \times 2/3  {
    %       c2  bes4
    %     }
    %     | % 35
    %     \times 2/3  {
    %       a2  es'4
    %     }
    %     \times 2/3  {
    %       d2  a'4
    %     }
    %     | % 36
    %     \times 2/3  {
    %       g2  bes,4
    %     }
    %     \times 2/3  {
    %       c2  bes4
    %     }
    %     | % 37
    %     \times 2/3  {
    %       a2  es'4
    %     }
    %     \times 2/3  {
    %       d2  a'4
    %     }
    %     | % 38
    %     \times 2/3  {
    %       g2  bes,4
    %     }
    %     \times 2/3  {
    %       c2  bes4
    %     }
    %     | % 39
    %     \times 2/3  {
    %       a2  es'4
    %     }
    %     \times 2/3  {
    %       d2  a'4
    %   }
  }
 
  \repeat volta 2 {
    | % 47
    \key des \major  bes,4  f'8  bes r4
    f4 | % 48
    bes,4  bes8  f' r4  f | % 49
    bes,4  f'8  bes r4  f |  
    bes,4  bes8  f' r4  f
  }
  \repeat volta 4 {
    %    bes,4  f'8  bes r4  f | % 52
    %     bes,4  bes8  f' r4  f | % 53
    %     bes,4  f'8  bes r4  f | % 54
    %     bes,4  bes8  f' r4  f
  }
  \repeat volta 2 {
    | % 55
    bes,4  f'8  bes r4  f | % 56
    bes,4  bes8  f' r4  f | % 57
  }
  | % 59
  r16  a8  ges16 ~  ges  es8
  c16  es  f  ges 
  es16  f8.  bes16 \bar "|."
}

PartPFiveVoiceOne =  \relative f' {
  \clef "percussion" \numericTimeSignature\time 4/4 \key c \major | % 1
  R1*4 \bar "||"
  <f \tweak style #'cross f' \tweak style #'cross a>8 \once
  \override NoteHead.style = #'cross  f'8  <\tweak
  style #'cross d, \tweak style #'cross c' \tweak style #'cross f>8
  <f \tweak style #'cross f'>8  <f \tweak style
  #'cross f'>8  <\tweak style #'cross c' \tweak style
  #'cross f>8  <\tweak style #'cross d, \tweak style
  #'cross f'>8  <f \tweak style #'cross f'> | % 6
  <f \tweak style #'cross c' \tweak style #'cross f>8 \once
  \override NoteHead.style = #'cross  f'8  <\tweak
  style #'cross d, \tweak style #'cross f'>8  <f \tweak
  style #'cross c' \tweak style #'cross f>8  <f \tweak
  style #'cross f'>8 \once \override NoteHead.style = #'cross
  f'8  <\tweak style #'cross d, \tweak style
  #'cross c' \tweak style #'cross f>8  <f \tweak style
  #'cross f'>8 | % 7
  <f \tweak style #'cross f'>8 \once \override
  NoteHead.style = #'cross  f'8  <\tweak style
  #'cross d, \tweak style #'cross c' \tweak style #'cross f>8
  <f \tweak style #'cross f'>8  <f \tweak style
  #'cross f'>8  <\tweak style #'cross c' \tweak style
  #'cross f>8  <\tweak style #'cross d, \tweak style
  #'cross f'>8  <f \tweak style #'cross f'> | % 8
  <f \tweak style #'cross c' \tweak style #'cross f>8 \once
  \override NoteHead.style = #'cross  f'8  <\tweak
  style #'cross d, \tweak style #'cross f'>8  <f \tweak
  style #'cross c' \tweak style #'cross f>8  <f \tweak
  style #'cross f'>8 \once \override NoteHead.style = #'cross
  f'8  <\tweak style #'cross d, \tweak style
  #'cross c' \tweak style #'cross f>8  <f \tweak style
  #'cross f'>8 | % 9
  <f \tweak style #'cross f' \tweak style #'cross a>8 \once
  \override NoteHead.style = #'cross  f'8  <\tweak
  style #'cross d, \tweak style #'cross c' \tweak style #'cross f>8
  <f \tweak style #'cross f'>8  <f \tweak style
  #'cross f'>8  <\tweak style #'cross c' \tweak style
  #'cross f>8  <\tweak style #'cross d, \tweak style
  #'cross f'>8  <f \tweak style #'cross f'> |
  
  <f \tweak style #'cross c' \tweak style #'cross f>8 \once
  \override NoteHead.style = #'cross  f'8  <\tweak
  style #'cross d, \tweak style #'cross f'>8  <f \tweak
  style #'cross c' \tweak style #'cross f>8  <f \tweak
  style #'cross f'>8 \once \override NoteHead.style = #'cross
  f'8  <\tweak style #'cross d, \tweak style
  #'cross c' \tweak style #'cross f>8  <f \tweak style
  #'cross f'>8 | % 11
  <f \tweak style #'cross c' \tweak style #'cross f>8 \once
  \override NoteHead.style = #'cross  f'8  <\tweak
  style #'cross d, \tweak style #'cross f'>8  <f \tweak
  style #'cross c' \tweak style #'cross f>8  <f \tweak
  style #'cross f'>8 \once \override NoteHead.style = #'cross
  f'8  <\tweak style #'cross d, \tweak style
  #'cross c' \tweak style #'cross f>8  <f \tweak style
  #'cross f'>8 | % 12
  <f \tweak style #'cross f'>8 \once \override
  NoteHead.style = #'cross  f'8  <\tweak style
  #'cross d, \tweak style #'cross c' \tweak style #'cross f>8
  <f \tweak style #'cross f'>8  <f \tweak style
  #'cross f'>8  <\tweak style #'cross c' \tweak style
  #'cross f>8  <\tweak style #'cross d, \tweak style
  #'cross f'>8  <f c' \tweak style #'cross f \tweak style
  #'cross b>8 \bar "||"
  <f \tweak style #'cross f' \tweak style #'cross a>8 \once
  \override NoteHead.style = #'cross  f'8  <\tweak
  style #'cross d, \tweak style #'cross c' \tweak style #'cross f>8
  <f \tweak style #'cross f'>8  <f \tweak style
  #'cross f'>8  <\tweak style #'cross c' \tweak style
  #'cross f>8  <\tweak style #'cross d, \tweak style
  #'cross f'>8  <f \tweak style #'cross f'> | % 14
  <f \tweak style #'cross c' \tweak style #'cross f>8 \once
  \override NoteHead.style = #'cross  f'8  <\tweak
  style #'cross d, \tweak style #'cross f'>8  <f \tweak
  style #'cross c' \tweak style #'cross f>8  <f \tweak
  style #'cross f'>8 \once \override NoteHead.style = #'cross
  f'8  <\tweak style #'cross d, \tweak style
  #'cross c' \tweak style #'cross f>8  <f \tweak style
  #'cross f'>8 | % 15
  <f \tweak style #'cross c' \tweak style #'cross f>8 \once
  \override NoteHead.style = #'cross  f'8  <\tweak
  style #'cross d, \tweak style #'cross f'>8  <f \tweak
  style #'cross c' \tweak style #'cross f>8  <f \tweak
  style #'cross f'>8 \once \override NoteHead.style = #'cross
  f'8  <\tweak style #'cross d, \tweak style
  #'cross c' \tweak style #'cross f>8  <f \tweak style
  #'cross f'>8 | % 16
  <f \tweak style #'cross f'>8 \once \override
  NoteHead.style = #'cross  f'8  <\tweak style
  #'cross d, \tweak style #'cross c' \tweak style #'cross f>8
  <f \tweak style #'cross f'>8  <f \tweak style
  #'cross f'>8  <\tweak style #'cross c' \tweak style
  #'cross f>8  <\tweak style #'cross d, \tweak style
  #'cross f'>8  <f c' \tweak style #'cross f \tweak style
  #'cross b>8 \bar "||"
  <f \tweak style #'cross f' \tweak style #'cross a>8 \once
  \override NoteHead.style = #'cross  f'8  <\tweak
  style #'cross d, \tweak style #'cross c' \tweak style #'cross f>8
  <f \tweak style #'cross f'>8  <f \tweak style
  #'cross f'>8  <\tweak style #'cross c' \tweak style
  #'cross f>8  <\tweak style #'cross d, \tweak style
  #'cross f'>8  <f \tweak style #'cross f'> | % 18
  <f \tweak style #'cross c' \tweak style #'cross f>8 \once
  \override NoteHead.style = #'cross  f'8  <\tweak
  style #'cross d, \tweak style #'cross f'>8  <f \tweak
  style #'cross c' \tweak style #'cross f>8  <f \tweak
  style #'cross f'>8 \once \override NoteHead.style = #'cross
  f'8  <\tweak style #'cross d, \tweak style
  #'cross c' \tweak style #'cross f>8  <f \tweak style
  #'cross f'>8 | % 19
  <f \tweak style #'cross f'>8 \once \override
  NoteHead.style = #'cross  f'8  <\tweak style
  #'cross d, \tweak style #'cross c' \tweak style #'cross f>8
  <f \tweak style #'cross f'>8  <f \tweak style
  #'cross f'>8  <\tweak style #'cross c' \tweak style
  #'cross f>8  <\tweak style #'cross d, \tweak style
  #'cross f'>8  <f \tweak style #'cross f'> |
  
  <f \tweak style #'cross c' \tweak style #'cross f>8 \once
  \override NoteHead.style = #'cross  f'8  <\tweak
  style #'cross d, \tweak style #'cross f'>8  <f \tweak
  style #'cross c' \tweak style #'cross f>8  <f \tweak
  style #'cross f'>8 \once \override NoteHead.style = #'cross
  f'8  <\tweak style #'cross d, \tweak style
  #'cross c' \tweak style #'cross f>8  <f \tweak style
  #'cross f'>8 | % 21
  <f \tweak style #'cross f' \tweak style #'cross a>8 \once
  \override NoteHead.style = #'cross  f'8  <\tweak
  style #'cross d, \tweak style #'cross c' \tweak style #'cross f>8
  <f \tweak style #'cross f'>8  <f \tweak style
  #'cross f'>8  <\tweak style #'cross c' \tweak style
  #'cross f>8  <\tweak style #'cross d, \tweak style
  #'cross f'>8  <f \tweak style #'cross f'> | % 22
  <f \tweak style #'cross c' \tweak style #'cross f>8 \once
  \override NoteHead.style = #'cross  f'8  <\tweak
  style #'cross d, \tweak style #'cross f'>8  <f \tweak
  style #'cross c' \tweak style #'cross f>8  <f \tweak
  style #'cross f'>8 \once \override NoteHead.style = #'cross
  f'8  <\tweak style #'cross d, \tweak style
  #'cross c' \tweak style #'cross f>8  <f \tweak style
  #'cross f'>8 | % 23
  <f \tweak style #'cross c' \tweak style #'cross f>8 \once
  \override NoteHead.style = #'cross  f'8  <\tweak
  style #'cross d, \tweak style #'cross f'>8  <f \tweak
  style #'cross c' \tweak style #'cross f>8  <f \tweak
  style #'cross f'>8 \once \override NoteHead.style = #'cross
  f'8  <\tweak style #'cross d, \tweak style
  #'cross c' \tweak style #'cross f>8  <f \tweak style
  #'cross f'>8 | % 24
  <f \tweak style #'cross f'>8 \once \override
  NoteHead.style = #'cross  f'8  <\tweak style
  #'cross d, \tweak style #'cross c' \tweak style #'cross f>8
  <f \tweak style #'cross f'>8  <f \tweak style
  #'cross f'>8  <\tweak style #'cross c' \tweak style
  #'cross f>8  <\tweak style #'cross d, \tweak style
  #'cross f'>8  <f c' \tweak style #'cross f \tweak style
  #'cross b>8 | % 25
  <f c' \tweak style #'cross f \tweak style #'cross b>8.
  <f c' \tweak style #'cross f \tweak style #'cross b>8.
  <f c' \tweak style #'cross f \tweak style #'cross b>8 r2 | % 26
  <f c' \tweak style #'cross f \tweak style #'cross b>8.
  <f c' \tweak style #'cross f \tweak style #'cross b>8.
  <f c' \tweak style #'cross f \tweak style #'cross b>8 r2 | % 27
  <f \tweak style #'cross f' \tweak style #'cross a>8 \once
  \override NoteHead.style = #'cross  f'8  <\tweak
  style #'cross d, \tweak style #'cross c' \tweak style #'cross f>8
  <f \tweak style #'cross f'>8  <f \tweak style
  #'cross f'>8  <\tweak style #'cross c' \tweak style
  #'cross f>8  <\tweak style #'cross d, \tweak style
  #'cross f'>8  <f \tweak style #'cross f'> | % 28
  <f \tweak style #'cross c' \tweak style #'cross f>8 \once
  \override NoteHead.style = #'cross  f'8  <\tweak
  style #'cross d, \tweak style #'cross f'>8  <f \tweak
  style #'cross c' \tweak style #'cross f>8  <f \tweak
  style #'cross f'>8 \once \override NoteHead.style = #'cross
  f'8  <\tweak style #'cross d, \tweak style
  #'cross c' \tweak style #'cross f>8  <f \tweak style
  #'cross f'>8 | % 29
  <f \tweak style #'cross f'>8 \once \override
  NoteHead.style = #'cross  f'8  <\tweak style
  #'cross d, \tweak style #'cross c' \tweak style #'cross f>8
  <f \tweak style #'cross f'>8  <f \tweak style
  #'cross f'>8  <\tweak style #'cross c' \tweak style
  #'cross f>8  <\tweak style #'cross d, \tweak style
  #'cross f'>8  <f \tweak style #'cross f'> |
  
  <f \tweak style #'cross c' \tweak style #'cross f>8 \once
  \override NoteHead.style = #'cross  f'8  <\tweak
  style #'cross d, \tweak style #'cross f'>8  <f \tweak
  style #'cross c' \tweak style #'cross f>8  <f \tweak
  style #'cross f'>8 \once \override NoteHead.style = #'cross
  f'8  <\tweak style #'cross d, \tweak style
  #'cross c' \tweak style #'cross f>8  <f \tweak style
  #'cross f'>8 | % 31
  <f c' \tweak style #'cross f \tweak style #'cross b>8..
  <f c' \tweak style #'cross f \tweak style #'cross b>32 r8
  <f c' \tweak style #'cross f \tweak style #'cross b>8
  <f c' \tweak style #'cross f \tweak style #'cross b>8 r r4
  \repeat volta 3 {
    | % 32
    <f \tweak style #'cross f' \tweak style #'cross a>8
    \once \override NoteHead.style = #'cross  f'8 
    <\tweak style #'cross d, \tweak style #'cross c' \tweak style
    #'cross f>8  <f \tweak style #'cross f'> 
    <f \tweak style #'cross f'>8  <\tweak style #'cross c'
    \tweak style #'cross f>8  <\tweak style #'cross d,
    \tweak style #'cross f'>8  <f \tweak style #'cross
    f'>8 | % 33
    <f \tweak style #'cross c' \tweak style #'cross f>8
    \once \override NoteHead.style = #'cross  f'8 
    <\tweak style #'cross d, \tweak style #'cross f'>8  <f
    \tweak style #'cross c' \tweak style #'cross f>8 
    <f \tweak style #'cross f'>8 \once \override NoteHead.style =
    #'cross  f'8  <\tweak style #'cross d, \tweak
    style #'cross c' \tweak style #'cross f>8  <f
    \tweak style #'cross f'>8 | % 34
    <f \tweak style #'cross f' \tweak style #'cross a>8
    \once \override NoteHead.style = #'cross  f'8 
    <\tweak style #'cross d, \tweak style #'cross c' \tweak style
    #'cross f>8  <f \tweak style #'cross f'> 
    <f \tweak style #'cross f'>8  <\tweak style #'cross c'
    \tweak style #'cross f>8  <\tweak style #'cross d,
    \tweak style #'cross f'>8  <f \tweak style #'cross
    f'>8 | % 35
    <f \tweak style #'cross c' \tweak style #'cross f>8
    \once \override NoteHead.style = #'cross  f'8 
    <\tweak style #'cross d, \tweak style #'cross f'>8  <f
    \tweak style #'cross c' \tweak style #'cross f>8 
    <f \tweak style #'cross f'>8 \once \override NoteHead.style =
    #'cross  f'8  <\tweak style #'cross d, \tweak
    style #'cross c' \tweak style #'cross f>8  <f
    \tweak style #'cross f'>8 | % 36
    <f \tweak style #'cross f' \tweak style #'cross a>8
    \once \override NoteHead.style = #'cross  f'8 
    <\tweak style #'cross d, \tweak style #'cross c' \tweak style
    #'cross f>8  <f \tweak style #'cross f'> 
    <f \tweak style #'cross f'>8  <\tweak style #'cross c'
    \tweak style #'cross f>8  <\tweak style #'cross d,
    \tweak style #'cross f'>8  <f \tweak style #'cross
    f'>8 | % 37
    <f \tweak style #'cross c' \tweak style #'cross f>8
    \once \override NoteHead.style = #'cross  f'8 
    <\tweak style #'cross d, \tweak style #'cross f'>8  <f
    \tweak style #'cross c' \tweak style #'cross f>8 
    <f \tweak style #'cross f'>8 \once \override NoteHead.style =
    #'cross  f'8  <\tweak style #'cross d, \tweak
    style #'cross c' \tweak style #'cross f>8  <f
    \tweak style #'cross f'>8 | % 38
    <f \tweak style #'cross f' \tweak style #'cross a>8
    \once \override NoteHead.style = #'cross  f'8 
    <\tweak style #'cross d, \tweak style #'cross c' \tweak style
    #'cross f>8  <f \tweak style #'cross f'> 
    <f \tweak style #'cross f'>8  <\tweak style #'cross c'
    \tweak style #'cross f>8  <\tweak style #'cross d,
    \tweak style #'cross f'>8  <f \tweak style #'cross
    f'>8 | % 39
    <f \tweak style #'cross c' \tweak style #'cross f>8
    \once \override NoteHead.style = #'cross  f'8 
    <\tweak style #'cross d, \tweak style #'cross f'>8  <f
    \tweak style #'cross c' \tweak style #'cross f>8 
    <f \tweak style #'cross f'>8 \once \override NoteHead.style =
    #'cross  f'8  <\tweak style #'cross d, \tweak
    style #'cross c' \tweak style #'cross f>8  <f
    \tweak style #'cross f'>8 | 
    <f \tweak style #'cross f' \tweak style #'cross a>8
    \once \override NoteHead.style = #'cross  f'8 
    <\tweak style #'cross d, \tweak style #'cross c' \tweak style
    #'cross f>8  <f \tweak style #'cross f'> 
    <f \tweak style #'cross f'>8  <\tweak style #'cross c'
    \tweak style #'cross f>8  <\tweak style #'cross d,
    \tweak style #'cross f'>8  <f \tweak style #'cross
    f'>8 | % 41
    <f \tweak style #'cross c' \tweak style #'cross f>8
    \once \override NoteHead.style = #'cross  f'8 
    <\tweak style #'cross d, \tweak style #'cross f'>8  <f
    \tweak style #'cross c' \tweak style #'cross f>8 
    <f \tweak style #'cross f'>8 \once \override NoteHead.style =
    #'cross  f'8  <\tweak style #'cross d, \tweak
    style #'cross c' \tweak style #'cross f>8  <f
    \tweak style #'cross f'>8 | % 42
    <f \tweak style #'cross f' \tweak style #'cross a>8
    \once \override NoteHead.style = #'cross  f'8 
    <\tweak style #'cross d, \tweak style #'cross c' \tweak style
    #'cross f>8  <f \tweak style #'cross f'> 
    <f \tweak style #'cross f'>8  <\tweak style #'cross c'
    \tweak style #'cross f>8  <\tweak style #'cross d,
    \tweak style #'cross f'>8  <f \tweak style #'cross
    f'>8 | % 43
    <f \tweak style #'cross c' \tweak style #'cross f>8
    \once \override NoteHead.style = #'cross  f'8 
    <\tweak style #'cross d, \tweak style #'cross f'>8  <f
    \tweak style #'cross c' \tweak style #'cross f>8 
    <f \tweak style #'cross f'>8 \once \override NoteHead.style =
    #'cross  f'8  <\tweak style #'cross d, \tweak
    style #'cross c' \tweak style #'cross f>8  <f
    \tweak style #'cross f'>8
  }
  | % 44
  <f \tweak style #'cross f'>8 \once \override
  NoteHead.style = #'cross  f'8  <\tweak style
  #'cross d, \tweak style #'cross c' \tweak style #'cross f>8
  <f \tweak style #'cross f'>8  <f \tweak style
  #'cross f'>8  <\tweak style #'cross c' \tweak style
  #'cross f>8  <\tweak style #'cross d, \tweak style
  #'cross f'>8  <f \tweak style #'cross f'> | % 45
  <f \tweak style #'cross c' \tweak style #'cross f>8 \once
  \override NoteHead.style = #'cross  f'8  <\tweak
  style #'cross d, \tweak style #'cross f'>8  <f \tweak
  style #'cross c' \tweak style #'cross f>8  <f \tweak
  style #'cross f'>8 \once \override NoteHead.style = #'cross
  f'8  <\tweak style #'cross d, \tweak style
  #'cross c' \tweak style #'cross f>8  <f \tweak style
  #'cross f'>8 | % 46
  <f c' \tweak style #'cross f \tweak style #'cross b>4
  <f c' \tweak style #'cross f \tweak style #'cross b>8
  <f c' \tweak style #'cross f \tweak style #'cross b>8
  <f c' \tweak style #'cross f \tweak style #'cross b>4 r
  \repeat volta 2 {
    | % 47
    <f \tweak style #'cross f' \tweak style #'cross a>8
    \once \override NoteHead.style = #'cross  f'8 
    <\tweak style #'cross d, \tweak style #'cross c' \tweak style
    #'cross f>8  <f \tweak style #'cross f'> 
    <f \tweak style #'cross f'>8  <\tweak style #'cross c'
    \tweak style #'cross f>8  <\tweak style #'cross d,
    \tweak style #'cross f'>8  <f \tweak style #'cross
    f'>8 | % 48
    <f \tweak style #'cross c' \tweak style #'cross f>8
    \once \override NoteHead.style = #'cross  f'8 
    <\tweak style #'cross d, \tweak style #'cross f'>8  <f
    \tweak style #'cross c' \tweak style #'cross f>8 
    <f \tweak style #'cross f'>8 \once \override NoteHead.style =
    #'cross  f'8  <\tweak style #'cross d, \tweak
    style #'cross c' \tweak style #'cross f>8  <f
    \tweak style #'cross f'>8 | % 49
    <f \tweak style #'cross f' \tweak style #'cross a>8
    \once \override NoteHead.style = #'cross  f'8 
    <\tweak style #'cross d, \tweak style #'cross c' \tweak style
    #'cross f>8  <f \tweak style #'cross f'> 
    <f \tweak style #'cross f'>8  <\tweak style #'cross c'
    \tweak style #'cross f>8  <\tweak style #'cross d,
    \tweak style #'cross f'>8  <f \tweak style #'cross
    f'>8 | 
    <f \tweak style #'cross c' \tweak style #'cross f>8
    \once \override NoteHead.style = #'cross  f'8 
    <\tweak style #'cross d, \tweak style #'cross f'>8  <f
    \tweak style #'cross c' \tweak style #'cross f>8 
    <f \tweak style #'cross f'>8 \once \override NoteHead.style =
    #'cross  f'8  <\tweak style #'cross d, \tweak
    style #'cross c' \tweak style #'cross f>8  <f
    \tweak style #'cross f'>8
  }
  \repeat volta 4 {
    | % 51
    <f \tweak style #'cross f' \tweak style #'cross a>8
    \once \override NoteHead.style = #'cross  f'8 
    <\tweak style #'cross d, \tweak style #'cross c' \tweak style
    #'cross f>8  <f \tweak style #'cross f'> 
    <f \tweak style #'cross f'>8  <\tweak style #'cross c'
    \tweak style #'cross f>8  <\tweak style #'cross d,
    \tweak style #'cross f'>8  <f \tweak style #'cross
    f'>8 | % 52
    <f \tweak style #'cross c' \tweak style #'cross f>8
    \once \override NoteHead.style = #'cross  f'8 
    <\tweak style #'cross d, \tweak style #'cross f'>8  <f
    \tweak style #'cross c' \tweak style #'cross f>8 
    <f \tweak style #'cross f'>8 \once \override NoteHead.style =
    #'cross  f'8  <\tweak style #'cross d, \tweak
    style #'cross c' \tweak style #'cross f>8  <f
    \tweak style #'cross f'>8 | % 53
    <f \tweak style #'cross f' \tweak style #'cross a>8
    \once \override NoteHead.style = #'cross  f'8 
    <\tweak style #'cross d, \tweak style #'cross c' \tweak style
    #'cross f>8  <f \tweak style #'cross f'> 
    <f \tweak style #'cross f'>8  <\tweak style #'cross c'
    \tweak style #'cross f>8  <\tweak style #'cross d,
    \tweak style #'cross f'>8  <f \tweak style #'cross
    f'>8 | % 54
    <f \tweak style #'cross c' \tweak style #'cross f>8
    \once \override NoteHead.style = #'cross  f'8 
    <\tweak style #'cross d, \tweak style #'cross f'>8  <f
    \tweak style #'cross c' \tweak style #'cross f>8 
    <f \tweak style #'cross f'>8 \once \override NoteHead.style =
    #'cross  f'8  <\tweak style #'cross d, \tweak
    style #'cross c' \tweak style #'cross f>8  <f
    \tweak style #'cross f'>8
  }
  \repeat volta 2 {
    | % 55
    <f \tweak style #'cross f' \tweak style #'cross a>8
    \once \override NoteHead.style = #'cross  f'8 
    <\tweak style #'cross d, \tweak style #'cross c' \tweak style
    #'cross f>8  <f \tweak style #'cross f'> 
    <f \tweak style #'cross f'>8  <\tweak style #'cross c'
    \tweak style #'cross f>8  <\tweak style #'cross d,
    \tweak style #'cross f'>8  <f \tweak style #'cross
    f'>8 | % 56
    <f \tweak style #'cross c' \tweak style #'cross f>8
    \once \override NoteHead.style = #'cross  f'8 
    <\tweak style #'cross d, \tweak style #'cross f'>8  <f
    \tweak style #'cross c' \tweak style #'cross f>8 
    <f \tweak style #'cross f'>8 \once \override NoteHead.style =
    #'cross  f'8  <\tweak style #'cross d, \tweak
    style #'cross c' \tweak style #'cross f>8  <f
    \tweak style #'cross f'>8 | % 57
    <f \tweak style #'cross f' \tweak style #'cross a>8
    \once \override NoteHead.style = #'cross  f'8 
    <\tweak style #'cross d, \tweak style #'cross c' \tweak style
    #'cross f>8  <f \tweak style #'cross f'> 
    <f \tweak style #'cross f'>8  <\tweak style #'cross c'
    \tweak style #'cross f>8  <\tweak style #'cross d,
    \tweak style #'cross f'>8  <f \tweak style #'cross
    f'>8 | % 58
    <f \tweak style #'cross c' \tweak style #'cross f>8
    \once \override NoteHead.style = #'cross  f'8 
    <\tweak style #'cross d, \tweak style #'cross f'>8  <f
    \tweak style #'cross c' \tweak style #'cross f>8 
    <f \tweak style #'cross f'>8 \once \override NoteHead.style =
    #'cross  f'8  <\tweak style #'cross d, \tweak
    style #'cross c' \tweak style #'cross f>8  <f
    \tweak style #'cross f'>8
  }
  | % 59
  r16  f'8  e16 r  d8  a16  c
  c16  c  c  a8.  <f \tweak
  style #'cross f' \tweak style #'cross a>16 \bar "|."
}

PartPSixVoiceOne =  \relative f' {
  \clef "percussion" \numericTimeSignature\time 4/4 \key c \major
  \stopStaff \override Staff.StaffSymbol.line-count = #1 \startStaff | % 1
  R1*4 \bar "||"
  \once \override NoteHead.style = #'cross  f4.  e8
  e4. \once \override NoteHead.style = #'cross  f8 | % 6
  r4 r8  e  e  e  e4 | % 7
  \once \override NoteHead.style = #'cross  f4.  e8
  e4. \once \override NoteHead.style = #'cross  f8 | % 8
  r4 r8  e  e  e  e4 | % 9
  \once \override NoteHead.style = #'cross  f4.  e8
  e4. \once \override NoteHead.style = #'cross  f8 |
  
  r4 r8  e  e  e  e4 | % 11
  \once \override NoteHead.style = #'cross  f4.  e8
  e4. \once \override NoteHead.style = #'cross  f8 | % 12
  r4 r8  e  e  e  e4 \bar "||"
  \once \override NoteHead.style = #'cross  f4.  e8
  e4. \once \override NoteHead.style = #'cross  f8 | % 14
  r4 r8  e  e  e  e4 | % 15
  \once \override NoteHead.style = #'cross  f4.  e8
  e4. \once \override NoteHead.style = #'cross  f8 | % 16
  r4 r8  e  e  e  e4 \bar "||"
  \once \override NoteHead.style = #'cross  f4.  e8
  e4. \once \override NoteHead.style = #'cross  f8 | % 18
  r4 r8  e  e  e  e4 | % 19
  \once \override NoteHead.style = #'cross  f4.  e8
  e4. \once \override NoteHead.style = #'cross  f8 |
  
  r4 r8  e  e  e  e4 | % 21
  \once \override NoteHead.style = #'cross  f4.  e8
  e4. \once \override NoteHead.style = #'cross  f8 | % 22
  r4 r8  e  e  e  e4 | % 23
  \once \override NoteHead.style = #'cross  f4.  e8
  e4. \once \override NoteHead.style = #'cross  f8 | % 24
  r4 r8  e  e  e  e4 | % 25
  \once \override NoteHead.style = #'cross  f8.  d
  e8 r4. r8 | % 26
  \once \override NoteHead.style = #'cross  f8.  d
  e8 r4. r8 | % 27
  \once \override NoteHead.style = #'cross  f4.  e8
  e4. \once \override NoteHead.style = #'cross  f8 | % 28
  r4 r8  e  e  e  e4 | % 29
  \once \override NoteHead.style = #'cross  f4.  e8
  e4. \once \override NoteHead.style = #'cross  f8 |
  
  r4 r8  e  e  e  e4 | % 31
  \once \override NoteHead.style = #'cross  f8..  d32 r8
  d8  d r r4 \repeat volta 3 {
    | % 32
    \once \override NoteHead.style = #'cross  f4. 
    e8  e4. \once \override NoteHead.style = #'cross
    f8 | % 33
    r4 r8  e  e  e  e4 | % 34
    \once \override NoteHead.style = #'cross  f4. 
    e8  e4. \once \override NoteHead.style = #'cross
    f8 | % 35
    r4 r8  e  e  e  e4 | % 36
    \once \override NoteHead.style = #'cross  f4. 
    e8  e4. \once \override NoteHead.style = #'cross
    f8 | % 37
    r4 r8  e  e  e  e4 | % 38
    \once \override NoteHead.style = #'cross  f4. 
    e8  e4. \once \override NoteHead.style = #'cross
    f8 | % 39
    r4 r8  e  e  e  e4 |
    
    \once \override NoteHead.style = #'cross  f4. 
    e8  e4. \once \override NoteHead.style = #'cross
    f8 | % 41
    r4 r8  e  e  e  e4 | % 42
    \once \override NoteHead.style = #'cross  f4. 
    e8  e4. \once \override NoteHead.style = #'cross
    f8 | % 43
    r4 r8  e  e  e  e4
  }
  | % 44
  \once \override NoteHead.style = #'cross  f4.  e8
  e4. \once \override NoteHead.style = #'cross  f8 | % 45
  r4 r8  e  e  e  e4 | % 46
  e4  d8  d  e4 r \repeat volta 2 {
    | % 47
    \once \override NoteHead.style = #'cross  f4. 
    e8  e4. \once \override NoteHead.style = #'cross
    f8 | % 48
    r4 r8  e  e  e  e4 | % 49
    \once \override NoteHead.style = #'cross  f4. 
    e8  e4. \once \override NoteHead.style = #'cross
    f8 | 
    r4 r8  e  e  e  e4
  }
  \repeat volta 4 {
    | % 51
    \once \override NoteHead.style = #'cross  f4. 
    e8  e4. \once \override NoteHead.style = #'cross
    f8 | % 52
    r4 r8  e  e  e  e4 | % 53
    \once \override NoteHead.style = #'cross  f4. 
    e8  e4. \once \override NoteHead.style = #'cross
    f8 | % 54
    r4 r8  e  e  e  e4
  }
  \repeat volta 2 {
    | % 55
    \once \override NoteHead.style = #'cross  f4. 
    e8  e4. \once \override NoteHead.style = #'cross
    f8 | % 56
    r4 r8  e  e  e  e4 | % 57
    \once \override NoteHead.style = #'cross  f4. 
    e8  e4. \once \override NoteHead.style = #'cross
    f8 | % 58
    r4 r8  e  e  e  e4
  }
  | % 59
  R1 \bar "|."
}


% The score definition
\book {
  \paper {
    #(set-paper-size "a4")
  }
  \header { meter = \CleSol }
  #(define output-suffix "Ca4")

  \score {
    <<
      \new ChordNames \Accords
      \new Staff \Trompette
      \new Staff \Tenor
      \new Staff \with { \RemoveEmptyStaves } \Guitare
      \new Staff \with {  \RemoveEmptyStaves } \Basse
    >>
} }

\book {
  \paper {
    #(set-paper-size "a4")
    ragged-last-bottom = ##t
  }
  \header { meter = \Bb }
  #(define output-suffix "Bba4")

  \score {
    <<
      \new ChordNames \transpose c d \Accords
      \new Staff \transpose c d \Trompette
      \new Staff \transpose c d \Tenor
      %       \new Staff \transpose c d \with { \RemoveEmptyStaves } \Guitare
      %       \new Staff \transpose c d \with {  \RemoveEmptyStaves } \Basse
    >>
} }

\book {
  \paper {
    #(set-paper-size "a4")
  }
  \header { meter = \Eb }
  #(define output-suffix "Eba4")

  \score {
    <<
      \new ChordNames \transpose c a \Accords
      \new Staff \transpose c a \TrompetteII
      \new Staff \transpose c a \TenorII
      %       \new Staff \transpose c d \with { \RemoveEmptyStaves } \Guitare
      %       \new Staff \transpose c d \with {  \RemoveEmptyStaves } \Basse
    >>
} }


\book {
  \paper {
    #(set-paper-size "tablette")
  }
  \header { meter = \CleSol }
  #(define output-suffix "CTab")

  \score {
    <<
      \new ChordNames \Accords
      \new Staff \Trompette
      \new Staff \Tenor
      \new Staff \with { \RemoveEmptyStaves } \Guitare
      \new Staff \with {  \RemoveEmptyStaves } \Basse
    >>
} }

\book {
  \paper {
    #(set-paper-size "tablette")
  }
  \header { meter = \Bb }
  #(define output-suffix "BbTab")

  \score {
    <<
      \new ChordNames \transpose c d \Accords
      \new Staff \transpose c d \Trompette
      \new Staff \transpose c d \Tenor
      %       \new Staff \transpose c d \with { \RemoveEmptyStaves } \Guitare
      %       \new Staff \transpose c d \with {  \RemoveEmptyStaves } \Basse
    >>
} }

\book {
  \paper {
    #(set-paper-size "tablette")
  }
  \header { meter = \Eb }
  #(define output-suffix "EbTab")

  \score {
    <<
      \new ChordNames \transpose c a \Accords
      \new Staff \transpose c a \TrompetteII
      \new Staff \transpose c a \TenorII
      %       \new Staff \transpose c d \with { \RemoveEmptyStaves } \Guitare
      %       \new Staff \transpose c d \with {  \RemoveEmptyStaves } \Basse
    >>
} }


