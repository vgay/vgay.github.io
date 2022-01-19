\version "2.22.1"
#(set-global-staff-size 17)
\include "double-mark.ly"
\include "AdditionalFunctions.ly"
\include "VariablesJazz.ly"
\include "jazzchords.ily"
\include "lilyjazz.ily"



\paper {
  indent = 0\mm
  ragged-last-bottom = ##f
  ragged-bottom = ##f
  ragged-last = ##f
  markup-system-spacing = #'((basic-distance . 23)
                             (minimum-distance . 8)
                             (padding . 1))
  score-system-spacing = #'((basic-distance . 23)
                            (minimum-distance . 20)
                            (padding . 5))
}

title = #"Slinky"
composer = #"John Scofield"
meter = #"(Med. Swing)"
kwtempo = #"Medium"
kwstyle = #"Swing"

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
  asplayed = #"John Scofield" % doit être commentée si vide
  url = #"https://www.youtube.com/watch?v=kfFnRFpueek"
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
    \override MultiMeasureRest #'expand-limit = #3
    %     \override NonMusicalPaperColumn #'line-break-permission = ##f
    %     \override NonMusicalPaperColumn #'page-break-permission = ##f
    % à remplacer par \autoLineBreaksOff et \autoBreaksOff
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
  %   \context { \RemoveEmptyStaffContext
  %              \override VerticalAxisGroup #'remove-first = ##t			% Concerne la première ligne
  %   }
}

\defineBarLine "||-[|:" #'("||" "[|:" "[|:")

form = \markup  \fill-line {
  \column {  }
  \column { \line { \with-color #red \fontsize #2 "Solos on AABBA then D.S. al Fine" } }
}

harmonies = \chordmode {
  \set chordChanges = ##f
  s1*5 g:m7 g:m7 g:m7
  g2.:7/d d2:m11 es2./f c2/d g2.:7/d  c2:7sus4 a2.:m9 c2:6.9 es2.:6.9 f2:6.9
  g1*5:m7 g:m7 g:m7
  g2:m7 s8 c2:7 s8 g1:m7 s4 g2:m7 s8 c2:7 s8 g1:m7 s4
  g1*5:m7
  g2:m7 s8 c2:7 s8 g1:m7 s4 g2:m7 s8 c2:7 s8 g1:m7 s4

}


theNotes =  \relative c' {
  \clef "treble" \key f \major \time 5/4
  \mark \markup { \box Intro \fontsize #-2 "(Guitar only)" }
  g8 <f' bes>-. r g, <f' bes> g, <g' c>-> <f bes>-. <g c>( <f bes>) |
  g,8 <f' bes>-. r <f bes>-> r \parenthesize f c( d) f g |
  g,8 <f' bes>-. r <f bes>-> r \parenthesize g, <g' c>-> <f bes>-. <g c>( <f bes>) |
  g,8 <f' bes>-. r <f bes>-> r \parenthesize f c( d) f d |
  \break \mark #1
  \once \override Staff.Clef #'break-visibility = #'#(#f #f #t)
  \repeat volta 2 {
    g,8 <f' bes>-. r g, <f' bes> g, <g' c>-> <f bes>-. <g c>( <f bes>) |
    g,8 <f' bes>-. r <f bes>-> r \parenthesize f c( d) f g |
    g,8 <f' bes>-. r <f bes>-> r \parenthesize g, <g' c>-> <f bes>-. <g c>( <f bes>) |
    g,8 <f' bes>-. r <f bes>-> r \parenthesize f c( d) f d |

    \break \mark #2
    <<
      { \acciaccatura fis'8 e4. ^\markup Guitar g8~ 2. | a8 e r g~ g2. |
        bes8 a r g a4 g8 f g4 | e2. r2 | \break
        e4. g8~ 2. | bes8 c4 8~ 8 bes~ bes2
        bes8 a r g a4 g8 f g4 | g2. r2 }
      \\
      { bes,4. _\markup "T.Sax" c8~ 2. | e8 c r d~ d2. |
        f8 e r d e4 d8 bes d4 | c2. r2 |
        bes4. c8~ 2. | e8 g4 8~ 8 f~ f2 |
        f8 e r d e4 d8 bes d4 | d2. r2 }
  >>  }
  \break \once \override Score.RehearsalMark #'self-alignment-X = #LEFT
  \mark \markup { \box C \fontsize #-2 "Tenor Sax" }
  \repeat volta 2 { d2. f2 | bes4. a8 r4 g e8 c | d2. f2 }
  \alternative { { g2. g2 } { g2. g2 } }
  \break \mark \markup { \box \raise #-1 A \with-color #red \musicglyph "scripts.varsegno" }
  g,,8 <f' bes>-. r g, <f' bes> g, <g' c>-> <f bes>-. <g c>( <f bes>) |
  g,8 <f' bes>-. r <f bes>-> r \parenthesize f c( d) f g |
  g,8 <f' bes>-. r <f bes>-> r \parenthesize g, <g' c>-> <f bes>-. <g c>( <f bes>) |
  g,8 <f' bes>-. r <f bes>-> r \parenthesize f c( d) f d | \bar "||"
  \break \mark #2
  <<
    { \acciaccatura fis'8 e4. ^\markup Guitar g8~ 2. | a8 e r g~ g2. |
      bes8 a r g a4 g8 f g4 | e2. r2 | \break
      e4. g8~ 2. | bes8 c4 8~ 8 bes~ bes2
      bes8 a r g a4 g8 f g4 | g2. r2 }
    \\
    { bes,4. _\markup "T.Sax" c8~ 2. | e8 c r d~ d2. |
      f8 e r d e4 d8 bes d4 | c2. r2 |
      bes4. c8~ 2. | e8 g4 8~ 8 f~ f2 |
      f8 e r d e4 d8 bes d4 | d2. r2 }
  >> \bar "||-[|:" \break \mark #4
  \repeat volta 2 {
    f4  f\< r8 e r e e4 |f4 f8
    \once \override TextScript #'extra-offset = #'( 5 . 0 )
    f ^\markup "Drums Fills" \comp #3
    f4 f r8 e r e e4 |
    \tweak self-alignment-X #RIGHT
    \mark \markup  { \with-color #red { "To Coda" \raise #1 \musicglyph "scripts.varcoda" } }
    f4 f8
    \once \override TextScript #'extra-offset = #'( 5 . 0 )
    f \! ^\markup \center-column { "Drums Fills or" "Solo break" }\comp #3
  } \break

  \once \override Score.RehearsalMark #'self-alignment-X = #LEFT
  \mark \markup \box Solos \repeat volta 2 { \comp # 20 } \break
  \mark-y-dir #`( (,left . ,DOWN) (,right . ,UP) )
  \doubleMark
  \markup {\with-color #red \bold "after solos D.S. al Coda"}
  \markup \with-color #red { \musicglyph "scripts.varcoda" }
  f4\< f r8 e r e e4 |f4 f8
  \once \override TextScript #'extra-offset = #'( 5 . 0 )
  f ^\markup "Drums Fills" \comp #3
  f4 f r8 e r e e4 | f4 f8 f~ f2.\! \fermata

  %\bar ".."
}



Basse = \relative c {
  \clef "treble" \key f \major \time 5/4
  % \partial 8
  % \showStartRepeatBar \bar "[|:"
  s1*5 \clef "bass"
  g4. 8 r c8~ 2 | g4. 8 r4 c f | g,4. 8 r c8~ 2 | g4. 8 r4 _\markup "Bass cont. sim" c f |
}



\book {
  \paper {
    #(set-paper-size "tablette")
    page-count = #2
  }
  #(define output-suffix "CTab")
  %\header { meter = \markup \with-color #red \bold "partition sur 2 pages" }
  \bookpart {
    \score {
      <<
        \new ChordNames { \harmonies }
        \new Staff \with { instrumentName = \CleSol\consists "Merge_rests_engraver" } <<
          %\new Voice \with { \consists "Pitch_squash_engraver" }
          \theNotes
        >>
        \new Staff \with { \RemoveEmptyStaves \override VerticalAxisGroup #'remove-first = ##t } \Basse
      >>
    } %\form
} }

\book {
  \paper {
    #(set-paper-size "tablette")
    page-count = #2
  }
  #(define output-suffix "BbTab")
  %\header { meter = \markup \with-color #red \bold "partition sur 2 pages" }
  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c d \harmonies }
        \new Staff \with { instrumentName = \Bb \consists "Merge_rests_engraver" } <<
          %\new Voice \with { \consists "Pitch_squash_engraver" }
          \transpose c d \theNotes
        >>
      >>
    } %\form
} }

\book {
  \paper {
    #(set-paper-size "tablette")
    page-count = #2
  }
  #(define output-suffix "EbTab")
  %\header { meter = \markup \with-color #red \bold "partition sur 2 pages" }
  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c a \harmonies }
        \new Staff \with { instrumentName = \Eb \consists "Merge_rests_engraver" } <<
          %\new Voice \with { \consists "Pitch_squash_engraver" }
          \transpose c a, \theNotes
        >>
      >>
    } %\form
} }

\book {
  \paper {
    #(set-paper-size "a4")
    page-count = #1
  }
  #(define output-suffix "Ca4")
  \bookpart {
    \score {
      <<
        \new ChordNames { \harmonies }
        \new Staff \with { instrumentName = \CleSol \consists "Merge_rests_engraver" }
        <<
          %\new Voice \with { \consists "Pitch_squash_engraver" }
          \theNotes
        >>
        \new Staff \with { \RemoveEmptyStaves \override VerticalAxisGroup #'remove-first = ##t } \Basse
      >>
} } }

\book {
  \paper {
    #(set-paper-size "a4")
    page-count = #1
  }
  #(define output-suffix "Bba4")
  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c d \harmonies }
        \new Staff \with { instrumentName = \Bb \consists "Merge_rests_engraver" } <<
          % \new Voice \with { \consists "Pitch_squash_engraver" }
          \transpose c d \theNotes
        >>
        \new Staff \with { \RemoveEmptyStaves \override VerticalAxisGroup #'remove-first = ##t } \Basse
      >>
} } }

\book {
  \paper {
    #(set-paper-size "a4")
    page-count = #1
  }
  #(define output-suffix "Eba4")
  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c a \harmonies }
        \new Staff \with { instrumentName = \Eb \consists "Merge_rests_engraver" } <<
          %\new Voice
          \transpose c a, \theNotes
        >>
        \new Staff \with { \RemoveEmptyStaves \override VerticalAxisGroup #'remove-first = ##t } \Basse
      >>
} } }

