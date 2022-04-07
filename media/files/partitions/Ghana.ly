\version "2.22.1"
#(set-global-staff-size 18)
\include "double-mark.ly"
\include "AdditionalFunctions.ly"
\include "VariablesJazz.ly"
\include "jazzchords.ily"
\include "lilyjazz.ily"
\include "chord-grid-JAS.ly"



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
  system-system-spacing = #'((basic-distance . 15)
                             (minimum-distance . 8)
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

title = #"Ghana"
composer = #"Donald Bird"
meter = #"(Fast Latin)"
kwtempo = #"Fast"
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
  asplayed = #"Donald Bird" % doit être commentée si vide
  url = #"https://www.youtube.com/watch?v=IhE2KM5WiWI"
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
  \right-column { \line { \with-color #red \fontsize #2 "Solos on AABBA (Swing)" }
                  \line { "After solos D.S. (play head) then D.C. (Outro) al Coda" }
  }
}

harmonies = \chordmode {
  \set chordChanges = ##f es1*4:m es1*8:m
  es1*4:m as2:7 des:7 ges:7 ces:7 f1:m5-7 bes:7 f2:m5-7 bes:7 es1:m
  as1:m7 des:7 ges:7+ s as:m7 des:7 ges:7+ s b:m7 e:7 a:7+ s c:m7 f:7 f:m7 bes:7
  es1*4:m as2:7 des:7 ges:7 ces:7 f2:m5-7 bes:8 es1:m

}

Piano =  \relative c' {
  \clef "treble" \key ges \major \time 4/4
  \once \override Score.RehearsalMark #'self-alignment-X = #LEFT
  \mark \markup { \box Intro / \box Outro }
  \showStartRepeatBar \bar "[|:"
  \repeat volta 2 { \grace < des ges>8 _\markup Pn. <c f>1~ | q4 r8 8 r <des ges> r <c f> | <des ges> <c f>~ q2.~ | q1 }
\break
}

theNotes =  \relative c' {
  \clef "treble" \key ges \major \time 4/4
\override Staff.TimeSignature.break-visibility = ##(#f #f #f)
\set Staff.printKeyCancellation = ##f
\break

%   \once \override Score.RehearsalMark #'self-alignment-X = #LEFT
%   \mark \markup { \box Intro / \box Outro }
%   \showStartRepeatBar \bar "[|:"
%   \repeat volta 2 { \grace < des ges>8 _\markup Pn. <c f>1~ | q4 r8 8 r <des ges> r <c f> | <des ges> <c f>~ q2.~ | q1 }
  << { \voiceOne bes'1 ^\markup Trp. | c2 des | f8 des r f des2~ | 2 c | bes1~ | 1~ | 2. }
     \\
     { \voiceTwo ges1 _\markup "Ten. 8va B." | as2 bes | des8 bes r des bes2~ | 2 as | ges1~ | 1~ | 2.}
  >>
  \oneVoice r4 | \toCoda r2 r4 r8 bes8 \break
  \once \override Score.RehearsalMark #'self-alignment-X = #LEFT
  \mark \markup { \box A \raise #1 \with-color #red \musicglyph "scripts.varsegno" }
  \repeat volta 2 {
    es4-. 8 8 des f r es | r es bes4 r2 | r4 es8 8 des f r es | r2 r4 r8 es \break
    <<  { \voiceOne bes'4 ces8 as~ 4. des,8 | as'4 bes8 ges~ 2 }
        \\
        { \voiceTwo ges,4. f8~ 2 | e4. es8~ 2 }
    >>
    \oneVoice
  }
  \alternative {
    { r8 bes des bes ces des es ges | bes bes as4-. r r8 bes8 }
    { f'8 as r ges f4 d8 << { \voiceOne  f~ | 4} \\ { \voiceTwo d8~ | 4 } >> r4 bes,8 es f ges }
  } \break \mark #2 \bar "||"
  bes4. as8 r2 | r as8 bes des bes | f es r f es4-. f8 es | r4 r8 ges f es d es
  bes'8 as r4 r bes8 as | r4 r8 as g as bes ces | des1 | r2 des4 4 \break
  cis2 a4 fis4 | gis a b cis | e,1 | r4 fis8 gis a b cis d
  d2 bes!4 g a bes c d | f1 | r2 r4 r8 bes, \break \bar "||" \mark #1
  es4-. 8 8 des f r es | r es bes4 r2 | r4 es8 8 des f r es | r2 r4 r8 es \break
  <<  { \voiceOne bes'4 ces8 as~ 4. des,8 | as'4 bes8 ges~ 2 }
      \\
      { \voiceTwo ges,4. f8~ 2 | e4. es8~ 2 }
  >>
  \oneVoice bes''8 as r ges e4 d8 es |
  \once \override Score.RehearsalMark #'direction = #DOWN
  \once \override Score.RehearsalMark #'self-alignment-X = #LEFT
  \mark \markup "  Solo Break"
  \comp #3 \startParenthesis \parenthesize \endParenthesis r8 \parenthesize bes
  \bar ".."
  \label #'theLastPage
}

theCoda = {
  \showStartRepeatBar \bar "[|:" \repeat volta 2 { \comp #8 }
  \once \override Score.RehearsalMark #'self-alignment-X = #RIGHT
  \mark \markup \rounded-box { "Vamp & Fade" }
}

chordsRhythm = \relative c' {
  \override Rest #'staff-position = #7
  \improvisationOn \override NoteHead.no-ledgers = ##t
  % \partial 8
  % \showStartRepeatBar \bar "[|:"


}

Basse = \relative c {
  \clef "bass" \key ges \major \time 4/4
  \override Staff.TimeSignature.break-visibility = ##(#f #f #f)
  \repeat volta 2 { \repeat unfold 2 { \grace s8 es4. bes'8~ 8 4 8 | es,4 bes' bes es,} }

  \bar ".."
}

grille = \chordmode {
   \mark #1 \bar "[|:"\repeat percent 4 { es1:m } \break
  as2:7 des:7 ges:7 ces:7 \set Score.repeatCommands = #'((volta "1.") )
  f1:m5-7 bes:7 \set Score.repeatCommands = #'((volta #f)) \bar ":|]"\break
   \stopStaff s1 \bar "" s \startStaff \set Score.repeatCommands = #'((volta "2.") )
    f2:m5-7 bes:7 es1:m \set Score.repeatCommands = #'((volta #f)) \break \bar "||" \mark #2
    \repeat unfold 2 { as1:m7 des:7 \repeat percent 2 { ges:7+ } } \break
    b:m7 e:7\repeat percent 2 {  a:7+  } \break
    c:m7 f:7 f:m7 bes:7 \break \bar "||" \mark #1
    \repeat percent 4 { es1:m } \break
  as2:7 des:7 ges:7 ces:7 f2:m5-7 bes:8 es1:m

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
        \new StaffGroup <<
          \new Staff \with { instrumentName = \CleSol } <<
            %\new Voice \with { \consists "Pitch_squash_engraver" }
            { \Piano \set Staff.explicitKeySignatureVisibility = ##(#f #f #f) \theNotes }
          >>
          \new Staff \Basse
      >> >>
    } \form
    \score {
      <<
        \new ChordNames { \chordmode { es1:m } }
        \new Staff \with { instrumentName = \markup \fontsize #3 \with-color #red \musicglyph "scripts.varcoda" } \theCoda
      >>
    }
} }

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
        \new ChordNames {\transpose c d  \harmonies }
        \new StaffGroup <<
          \new Staff \with { instrumentName = \Bb } <<
            %\new Voice \with { \consists "Pitch_squash_engraver" }
            { \Piano \set Staff.explicitKeySignatureVisibility = ##(#f #t #t) \transpose c d \theNotes }
          >>
          \new Staff \Basse
      >> >>
    } \form
    \score {
      <<
        \new ChordNames { \chordmode { es1:m } }
        \new Staff \with { instrumentName = \markup \fontsize #3 \with-color #red \musicglyph "scripts.varcoda" } \theCoda
      >>
    }
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
        \new ChordNames {\transpose c a  \harmonies }
        \new StaffGroup <<
          \new Staff \with { instrumentName = \Eb } <<
            %\new Voice \with { \consists "Pitch_squash_engraver" }
            { \Piano \set Staff.explicitKeySignatureVisibility = ##(#f #t #t) \transpose c a, \theNotes }
          >>
          \new Staff \Basse
      >> >>
    } \form
    \score {
      <<
        \new ChordNames { \chordmode { es1:m } }
        \new Staff \with { instrumentName = \markup \fontsize #3 \with-color #red \musicglyph "scripts.varcoda" } \theCoda
      >>
    }
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
        \new StaffGroup <<
          \new Staff \with { instrumentName = \CleSol } <<
            %\new Voice \with { \consists "Pitch_squash_engraver" }
            { \Piano \set Staff.explicitKeySignatureVisibility = ##(#f #f #f) \theNotes }
          >>
          \new Staff \Basse
      >> >>
    } \form
    \score {
      <<
        \new ChordNames { \chordmode { es1:m } }
        \new Staff \with { instrumentName = \markup \fontsize #3 \with-color #red \musicglyph "scripts.varcoda" } \theCoda
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
    print-page-number = ##f
    %page-count = #1
  }
  #(define output-suffix "Bba4")
  \bookpart {
    \score {
      <<
        \new ChordNames {\transpose c d  \harmonies }
        \new StaffGroup <<
          \new Staff \with { instrumentName = \Bb } <<
            %\new Voice \with { \consists "Pitch_squash_engraver" }
            { \Piano \set Staff.explicitKeySignatureVisibility = ##(#f #t #t) \transpose c d \theNotes }
          >>
          \new Staff \Basse
      >> >>
    } \form
    \score {
      <<
        \new ChordNames { \chordmode { es1:m } }
        \new Staff \with { instrumentName = \markup \fontsize #3 \with-color #red \musicglyph "scripts.varcoda" } \theCoda
      >>
    }
    }  \bookpart {
    \score {
      \gridLayout
      \new ChordGrid \transpose c d \grille
} } }

\book {
  \paper {
    #(set-paper-size "a4")
    print-page-number = ##f
    %page-count = #1
  }
  #(define output-suffix "Eba4")
  \bookpart {
    \score {
      <<
        \new ChordNames {\transpose c a  \harmonies }
        \new StaffGroup <<
          \new Staff \with { instrumentName = \Eb } <<
            %\new Voice \with { \consists "Pitch_squash_engraver" }
            { \Piano \set Staff.explicitKeySignatureVisibility = ##(#f #t #t) \transpose c a, \theNotes }
          >>
          \new Staff \Basse
      >> >>
    } \form
    \score {
      <<
        \new ChordNames { \chordmode { es1:m } }
        \new Staff \with { instrumentName = \markup \fontsize #3 \with-color #red \musicglyph "scripts.varcoda" } \theCoda
      >>
    }    }  \bookpart {
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