
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
                             (minimum-distance . 8)
                             (padding . 1))
  score-system-spacing = #'((basic-distance . 23)
                            (minimum-distance . 20)
                            (padding . 5))
}

title = #"Tatra-Ta"
composer = #"Tania Maria"
meter = #"(Fast Samba)"
kwtempo = #"Fast"
kwstyle = #"Samba"

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
  % asplayed = #"" % doit être commentée si vide
  url = #""
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
  \context { \RemoveEmptyStaffContext 				% ne pas imprimer les lignes vides (autres que la première)
             %              \override VerticalAxisGroup #'remove-first = ##t			% Concerne la première ligne
  }
}

\defineBarLine "||-[|:" #'("||" "[|:" "[|:") 

form = \markup  \fill-line {
  \column {  }
  \column { \line { \with-color #red \fontsize #2 "Solos on AABBA then D.S. al Fine" } }
}

harmonies = \chordmode {
  \set chordChanges = ##t
  r1*6 s2. c:9+ des2:9+ d:9+ es4.:9+ e8:9+ s1 a:9-13 s f2../g ges8/f f2/es des:5-7+
  c1*8:9
  \once \override ChordName.X-offset = #-16 % à ajuster
  c1*8:9
  c1:9 des:9 c:9 des:9 c:9 des:9 c:9 ges:9 f:9 ges:9 f:9 s c2:9+ bes:9 a1:9-5+
  d:7 es:7+ f2 fis:dim7 g1:7 c2.:9 c:9+ des2:9+ c:9+ des4.:9+ c8:9+ s2 des:9+ c4.:9+ des4:9+ c4.:9+
  d2:9+ es4.:9+ e8:9+ s1 a:9-13 s f2../g ges8/f f2/es des:5-7+
  c1*6:9 d2:9 es:9 f:9 g:9
  c1*8:9 r1*3 s2. c4:9+ c1*3:9 s2. r4
}


theNotes =  \relative c'' {
  \override MultiMeasureRest #'expand-limit = #3
  \clef "treble" \key f \major \time 4/4
  \showStartRepeatBar \bar "[|:" \mark #1
  \label #'A
  \repeat volta 2 {
    c8 bes g c, r c' bes g |
    c, r c' bes c bes g c, |
    r c' bes g c, c' bes g |
    r c, e g fis d fis a |
    g es g bes a f a c |
    b! g fis g g' ges f dis |
    e c bes c r4 \set Staff.ottavation = #"8vb" < e, bes' es>~ |
    q2 <f ces' fes>8 q q4 | \break
    <fis c'! f!>8 q q4 <g des' ges>8 q q <gis d'! g!>~ |
    q2~ \tuplet 3/2 { q4 <dis fis'> <e g'> } |
    <g cis fis bes!>1~ | 
    q |
    r2 <c f a>4 r8 <des ges bes> |
    <c f a>2-> <c f g>-> | \unset Staff.ottavation \break \mark #2
    \repeat percent 4 { <c g' c>4 c r8 <c g' c>4 c8 | r4 r8 <c g' c> r <c g' c> c4 }
  }
  \break  \mark #3
  %\override Score.SpacingSpanner.strict-note-spacing = ##t
  %\set Score.proportionalNotationDuration = #(ly:make-moment 1/1)
  \override Staff.MultiMeasureRest.space-increment = 35
  %\override Staff.MultiMeasureRest.X-extent = #'(-1 . 0)
  \inlineMMRN R1*7 
  \comp #2 r8  g4-. bes8~ | \bar "||-[|:" \mark #4 \break
  %\override Score.SpacingSpanner.strict-note-spacing = ##f
  \repeat volta 2 {
  bes1~ | 1~ | 1~ | 1 | 
  r4 r8 \set Staff.ottavation = #"8vb" g' bes c bes g | 
  bes4 g8 f g4 f8 g 
  e4 c8 bes c bes g ges8~ | 
  2  \unset Staff.ottavation r8 c4-. es8-> ~ | \break
  es1~ | 1~ |  1 | r4 r8 c es f es c | es4 c8 bes c4 bes8 g |
  bes g f g r c, e g |  fis4 d8 d fis4 a8 g~ | g4 es8 es g4 bes8 a~ | \break
  a4 f!8 a c4 d8 b~ | b g fis g g' ges f dis | 
  e c bes c r4 \set Staff.ottavation = #"8vb"  < e, bes' es>~ |
  q2 <f ces' fes>8 q q4 | \break 
}
\alternative {
  { < e bes' es>8 q q4 <f ces' fes>8 q q < e bes' es>8~ |
    q2 <f ces' fes>8 q q4 | 
    < e bes' es>8 q q <f ces' fes>8 \unset Staff.ottavation r8 g4 bes8 \laissezVibrer
  }
  { \break \set Staff.ottavation = #"8vb" <fis c'! f!>8 q q4 <g des' ges>8 q q <gis d'! g!>~ |
  }
}
q2~ \tuplet 3/2 { q4 <dis fis'> <e g'> } |
<g cis fis bes!>1~ | 
q |
r2 <c f a>4 r8 <des ges bes> |
<c f a>2-> <c f g>-> | \unset Staff.ottavation \break \bar "||-[|:"
\doubleMark
\markup \with-color #red \bold \larger \musicglyph "scripts.varcoda"
\markup { \box \bold E \small \rounded-box Solos }
\repeat volta 2 { 
  \repeat percent 3 { <c g' c>4 _\markup "(as is 1st & last x's)" c r8 <c g' c>4 c8 | r4 r8 <c g' c> r <c g' c> c4 }
  a2 bes
  \once \override Score.RehearsalMark.extra-offset = #'(8 . 0)
  \mark \markup \small \rounded-box "Vamp till cue"
  | c d  }
\break
\mark-y-dir #`( (,left . ,DOWN) (,right . ,UP) )
\doubleMark 
\markup { \with-link #'A { \with-color #red \center-column { "On cue D.C. al Coda" \small "(no repeats)" } }}
\markup \with-color #red \bold \larger \musicglyph "scripts.varcoda"
\repeat percent 4 { <c g' c>4 c r8 <c g' c>4 c8 | r4 r8 <c g' c> r <c g' c> c4 } \break
r8 c, e g fis d fis a |
g es g bes a f a c |
b! g fis g g' ges f dis |
e c bes c r4 \set Staff.ottavation = #"8vb" < e, bes' es>~ | \break
q1 | q | q | q2. \unset Staff.ottavation <c' c'>4-^ \sfz
\bar ".."
}


Basse = \relative c' {
  \clef "bass" \key f \major \time 4/4
  \showStartRepeatBar \bar "[|:"
  \repeat volta 2 {
    c8 bes g c, r c' bes g |
    c, r c' bes c bes g c, |
    r c' bes g c, c' bes g |
    r c, e g fis d fis a |
    g es g bes a f a c |
    b! g fis g g' ges f dis |
    e c bes c r4 c,4 ~ | c2 des4 r | d r es r8 e~ | e1 | a~ | a | 
    < g, g'>4 r g'-. r8 f | es2 des
    \repeat percent 4 { c4 c, r8 c'4 c,8 | r4 r8 c' r c c,4 }
    s1*24 \break \comp #8 c'4 g'8 c r4 c,~ | c2 des4 des | c c des r8 c~ | c2 des4 des c r8 des r2
    d!4 d es r8 e~ | e1 | a1~ | a | < g, g'>4 r g'-. r8 f | es2 des
    s1*16
    r8 c e g fis d fis a |
    g es g bes a f a c |
    b! g fis g g' ges f dis |
    e c bes c r4 c,4~ |
    c1~ | c~ | c~ | c2. <c c'>4-^
    
  }
}





\book {
  \paper {
    #(set-paper-size "tablette")
    %page-count = #1
  }
  #(define output-suffix "CTab")
  %\header { meter = \markup \with-color #red \bold "partition sur 2 pages" }
  \bookpart {
    \score {
      <<
        \new ChordNames { \harmonies }
        \new StaffGroup <<
          \new Staff \with { instrumentName = \CleSol } 
          <<
            %\new Voice \with { \consists "Pitch_squash_engraver" } 
            \theNotes
          >> 
          \new Staff \Basse
        >>
      >>
} } }

\book {
  \paper {
    #(set-paper-size "tablette")
    %page-count = #1
  }
  #(define output-suffix "BbTab") 
  %\header { meter = \markup \with-color #red \bold "partition sur 2 pages" }
  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c d \harmonies } 
        \new Staff \with { instrumentName = \Bb } <<
          %\new Voice \with { \consists "Pitch_squash_engraver" }  
          \transpose c d \theNotes
        >> 
      >>
    } %\form
} }

\book {
  \paper {
    #(set-paper-size "tablette")
    %page-count = #1
  }
  #(define output-suffix "EbTab")
  %\header { meter = \markup \with-color #red \bold "partition sur 2 pages" }
  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c a \harmonies }
        \new Staff \with { instrumentName = \Eb } <<
          %\new Voice \with { \consists "Pitch_squash_engraver" }  
          \transpose c a \theNotes
        >> 
      >>
    } %\form
} }

\book {
  \paper {
    #(set-paper-size "a4")
    %page-count = #1
  }
  #(define output-suffix "Ca4")
  \bookpart {
    \score {
      <<
        \new ChordNames { \harmonies }
        \new StaffGroup <<
          \new Staff \with { instrumentName = \CleSol } 
          <<
            %\new Voice \with { \consists "Pitch_squash_engraver" } 
            \theNotes
          >> 
          \new Staff \Basse
        >>
      >>
} } }

\book {
  \paper {
    #(set-paper-size "a4")
    %page-count = #1
  }
  #(define output-suffix "Bba4") 
  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c d \harmonies }
        \new StaffGroup <<
          \new Staff \with { instrumentName = \CleSol } 
          <<
            %\new Voice \with { \consists "Pitch_squash_engraver" } 
            \transpose c d \theNotes
          >> 
          \new Staff \transpose c d \Basse
        >>
      >>
} } }

\book {
  \paper {
    #(set-paper-size "a4")
    %page-count = #1
  }
  #(define output-suffix "Eba4")
  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c a \harmonies }
        \new StaffGroup <<
          \new Staff \with { instrumentName = \CleSol } 
          <<
            %\new Voice \with { \consists "Pitch_squash_engraver" } 
            \transpose c a, \theNotes
          >> 
          \new Staff \transpose c a, \Basse
        >>
      >>
} } }

