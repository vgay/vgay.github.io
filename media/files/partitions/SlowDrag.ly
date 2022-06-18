\version "2.22.1"
#(set-global-staff-size 17)
\include "double-mark.ly"
\include "AdditionalFunctions.ly"
\include "VariablesJazz.ly"
\include "jazzchords.ily"
\include "lilyjazz.ily"
\include "chord-grid-JAS.ly"



\paper {
  indent = 0\mm
  ragged-last-bottom = ##t
  ragged-bottom = ##t
  ragged-last = ##f
  markup-system-spacing = #'((basic-distance . 23)
                             (minimum-distance . 8)
                             (padding . 1))
  score-system-spacing = #'((basic-distance . 23)
                            (minimum-distance . 20)
                            (padding . 5))
  system-system-spacing = #'((basic-distance . 18)
                             (minimum-distance . 12)
                             (padding . 0))
  oddHeaderMarkup = \markup {
    \on-the-fly \print-page-number-check-first {
      \fill-line { \null \concat { \fromproperty #'page:page-number-string "/" \page-ref #'theLastPage "0" "?"} }
  } }
  evenHeaderMarkup = \markup {
    \on-the-fly \print-page-number-check-first {
      \fill-line { \concat { \fromproperty #'page:page-number-string "/" \page-ref #'theLastPage "0" "?"} \null }
    }
  }
}

title = #"Slow Drag"
composer = #"Donald Byrd"
meter = #"(Slow Blues)"
kwtempo = #"Mod. Slow"
kwstyle = #"Blues"

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
  asplayed = #"Donald Byrd" % doit être commentée si vide
  url = #"https://www.youtube.com/watch?v=G9evU2AD1Ws"
  arranger = \markup \on-the-fly #played?
  \with-url #url
  \with-color #blue \underline
  \concat { "(as played by " \fromproperty #'header:asplayed ")" }
  tagline = ##f
}

\layout {
  \context {
    \Score
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
}


form = \markup  \fill-line {
  \column {  }
  \column { \line { \with-color #red \fontsize #2 "Solos on AABBA then D.S. al Fine" } }
}

harmonies = \chordmode {
  \set chordChanges = ##f
  s4. r1*9 c1*4:7  c1*4:7  f1*4:7  c1*4:7
   a2..:m5-7/f as8:m5-7/e g2..:m5-7/es ges8:m5-7/d f2..:m5-7/des ges8:m5-7/d g2..:m5-7/es as8:m5-7/e
  a2..:m5-7/f as8:m5-7/e g2..:m5-7/es ges8:m5-7/d f1:m5-7/des g8:m5-7/es r2.. c1:7

}


theNotes =  \relative c'' {
  \clef "treble" \key f \major \time 4/4
  \partial 4. r4. \repeat volta 2 { R1*4 } \break \repeat volta 2 { R1*3 }
  \alternative { { R1 } { r4 \tuplet 3/2 { a8 c es~ } es16 c g a es c8. } } \break
  \mark-y-dir #`( (,left . ,DOWN) (,right . ,UP) )
  \doubleMark
  \markup { "Piano and Bass play Simile on" \box A \box B & \box D }
  \markup { \box A \raise #1 \with-color #red \musicglyph "scripts.varsegno" }
  g'8 <e bes'>8~ q2.~ | q1~ | q | r4 \tuplet 3/2 { c8 es f~ } f16 g es e c c8. \break
  es8 <e bes>8~ q2.~ | q1~ | q | r4 \tuplet 3/2 { a8 c es~ } es16 c g a es c8. \break \mark #2
  as'8 <e a>8~ q2.~ | q1~ | q | r4 \tuplet 3/2 { c8 es f~ } f16 g es e c c8.  \break
  es8 <e bes>8~ q2.~ | q1~ | q~ | q2 r \break \mark #3
  << \new Voice \with { \consists "Pitch_squash_engraver"  }
     { \voiceOne \improvisationOn \set squashedPosition = #7
       \override NoteHead.no-ledgers = ##t
       \repeat unfold 6 { b4. 8~ 4. 8 } 2 2
  8 s8 \improvisationOff } \new Voice { \voiceTwo \override MultiMeasureRest #'staff-position = #0 \override Rest #'staff-position = #0 R1*4 \break R1*3 r4 } >>

  \oneVoice \tuplet 3/2 {  a'8 c es~ } es16 c g a es c8. \break \mark #4
  g'8 <e bes'>8~ q2.~ | q1~ | q~ | q2 r

  \bar ".."
  \label #'theLastPage
}

chordsRhythm = \relative c' {
  \override Rest #'staff-position = #7
  \improvisationOn \override NoteHead.no-ledgers = ##t
  % \partial 8
  % \showStartRepeatBar \bar "[|:"


}

Basse = \relative c, {
  \clef "bass_8" \key f \major \time 4/4
  \set Staff.instrumentName = "LH Piano"
  \mark \markup \box Intro
  \partial 4. bes8~ 16 b8.
  \showStartRepeatBar \bar "[|:"
  \repeat volta 2 { c1~ | 2 r8 bes8~ 16 b8. | c1~ | 2 8 bes8~ 16 b8.  }
  \repeat volta 2 { c1~ | 2 r8 bes8~ 16 b8. | c1~ }
  \alternative { { 2 8 bes8~ 16 b8. } { c4-^ r r2 } }
  \bar ".."
}
BasseII = \relative c, {
  \clef "bass_8" \key f \major \time 4/4
  \set Staff.instrumentName = "Bass"
  \partial 4. r4.
  c1~ _\markup "Tacet 1st X" | 2 r8 bes8~ 16 b8. | c1~ | 2 8 bes8~ 16 b8.
  c4. g'8 4. c,8 | c4. g'8 8 bes,8~ 16 b8.| c4. g'8 4. c,8 | c4. g'8 8 bes,8~ 16 b8. | c4-^  r r2

  \bar ".."
}

grille = \chordmode {
  \mark #1 \repeat percent 4 { c1:7 } \break \repeat percent 4 { c1:7 } \break
  \mark #2 \repeat percent 4 { f1:7 } \break \repeat percent 4 { c1:7 } \break
  \mark #3 a2.:m5-7/f as4:m5-7/e g2.:m5-7/es ges4:m5-7/d f2.:m5-7/des ges4:m5-7/d g2.:m5-7/es as4:m5-7/e \break
  a2.:m5-7/f as4:m5-7/e g2.:m5-7/es ges4:m5-7/d f1:m5-7/des g4:m5-7/es r2. \break
  \mark #4 \repeat percent 4 { c1:7 }
  \bar ".." }



\book {
  \paper {
    #(set-paper-size "a5landscape")
    %page-count = #1
   print-first-page-number = ##t
  }
  #(define output-suffix "CTab")
  %\header { meter = \markup \with-color #red \bold "partition sur 2 pages" }
  \bookpart {
    \score {
      <<
        \new ChordNames { \harmonies }
        \new Staff \with { instrumentName = \CleSol } \theNotes
        \new Staff \Basse
        \new Staff \BasseII
      >>
} } }


\book {
  \paper {
    #(set-paper-size "a5landscape")
    %page-count = #1
    print-first-page-number = ##t
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
        \new Staff \Basse
        \new Staff \BasseII
      >>
    } %\form
} }

\book {
  \paper {
    #(set-paper-size "a5landscape")
    %page-count = #1
    print-first-page-number = ##t
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
        \new Staff \Basse
        \new Staff \BasseII
      >>
    } %\form
} }

\book {
  \paper {
    #(set-paper-size "a4")
    page-count = #1
    print-page-number = ##f
  }
  #(define output-suffix "Ca4")
  \bookpart {
    \score {
      <<
        \new ChordNames { \harmonies }
        \new Staff \with { instrumentName = \CleSol } \theNotes
        \new Staff \Basse
        \new Staff \BasseII
      >>
    }

    }  \bookpart {
    \score {
      \gridLayout
      \new ChordGrid \grille
} } }

\book {
  \paper {
    #(set-paper-size "a4")
    page-count = #1
    print-page-number = ##f
  }
  #(define output-suffix "Bba4")
  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c d \harmonies }
        \new Staff \with { instrumentName = \Bb  } <<
          % \new Voice \with { \consists "Pitch_squash_engraver" }
          \transpose c d \theNotes
        >>
        \new Staff \Basse
        \new Staff \BasseII
      >>
    } %\form
    }  \bookpart {
    \score {
      \gridLayout
      \new ChordGrid \transpose c d \grille
} } }

\book {
  \paper {
    #(set-paper-size "a4")
    page-count = #1
    print-page-number = ##f
  }
  #(define output-suffix "Eba4")
  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c a \harmonies }
        \new Staff \with { instrumentName = \Eb } <<
          %\new Voice
          \transpose c a \theNotes
        >>
        \new Staff \Basse
        \new Staff \BasseII
      >>
    } %\form
    }  \bookpart {
    \score {
      \gridLayout
      \new ChordGrid \transpose c a \grille
} } }

% \book {
%   \paper {
%     #(set-paper-size "tablette")
%     %page-count = #1
%   }
%   #(define output-suffix "BassTab")
%   %\header { meter = \markup \with-color #red \bold "partition sur 2 pages" }
%   \bookpart {
%     \score {
%       <<
%         \new ChordNames { \harmonies }
%         \new Staff \with { instrumentName = \CleFa } <<
%           %\new Voice \with { \consists "Pitch_squash_engraver" }
%           \Basse
%         >>
%       >>
%     } %\form
% } }
%
% \book {
%   \paper {
%     #(set-paper-size "a4")
%     %page-count = #1
%   }
%   #(define output-suffix "Bassa4")
%   \bookpart {
%     \score {
%       <<
%         \new ChordNames { \harmonies }
%         \new Staff \with { instrumentName = \CleFa }
%         <<
%           %\new Voice \with { \consists "Pitch_squash_engraver" }
%           \Basse
%         >>
%       >>
%     } %\form
%     %}  \bookpart {
%     \score {
%       \layout {
%         indent = 0
%         \context {
%           \Score
%           \override SpacingSpanner.strict-note-spacing = ##t
%           proportionalNotationDuration = #(ly:make-moment 1/16)
%         }
%         \context {
%           \ChordGrid
%           \override BarLine.bar-extent = #'(-5 . 5)
%           \consists "Bar_engraver"
%           \override StaffSymbol.line-positions = #'( -10 10 )
%           \consists "Percent_repeat_engraver"
%         }
%       }
%       \new ChordGrid \\grille
% } } }

% \book {
%   %\paper { %page-count = #1
%	#(set-paper-size "a4")}
%   \header {meter = \markup \pad-around #1 \circle \bold \fontsize #-3 \concat {" " \musicglyph #"clefs.G" " "} }
%   \bookpart {
%     #(define output-suffix "RSa4")
%     \score {
%       <<
%         \new ChordNames {
%           \set chordChanges = ##f
%           \Accords
%         }
%         \new Staff
%         <<
%           \set Staff.instrumentName = "Piano"
%           \new Voice = "Mel" { \chordsRhythm }
%         >>
%         \new Staff
%         <<
%           \set Staff.instrumentName = "Basse"
%           \new Voice = "Mel" { \clef "bass_8" \Basse }
%           \new Voice = "Ctrl" { \ossature }
%         >>
%       >>
%
%     } %\form
%     %}  \bookpart {
%     \score {
%       \layout {
%         indent = 0
%         \context {
%           \Score
%           \override SpacingSpanner.strict-note-spacing = ##t
%           proportionalNotationDuration = #(ly:make-moment 1/16)
%         }
%         \context {
%           \ChordGrid
%           \override BarLine.bar-extent = #'(-5 . 5)
%           \consists "Bar_engraver"
%           \override StaffSymbol.line-positions = #'( -10 10 )
%           \consists "Percent_repeat_engraver"
%         }
%       }
%       \new ChordGrid \transpose c a \grille
% } } }

% \book {
%   %\paper { %page-count = #2
%	#(set-paper-size "tablette")}
%   \header {meter = \markup \pad-around #1 \circle \bold \fontsize #-3 \concat {" " \musicglyph #"clefs.G" " "} }
%   \bookpart {
%     #(define output-suffix "RSTab")
%     \score {
%       <<
%         \new ChordNames {
%           \set chordChanges = ##f
%           \Accords
%         }
%         \new Staff
%         <<
%           \set Staff.instrumentName = "Piano"
%           \new Voice = "Mel" { \chordsRhythm }
%         >>
%         \new Staff
%         <<
%           \set Staff.instrumentName = "Basse"
%           \new Voice = "Mel" { \clef "bass_8" \Basse }
%           \new Voice = "Ctrl" { \ossature }
%         >>
%       >>
%
% } } }