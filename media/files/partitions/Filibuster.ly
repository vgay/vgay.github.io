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

title = #"Filibuster"
composer = #"John Scofield"
meter = #"(Med. Funk)"
kwtempo = #"Medium"
kwstyle = #"Funk"

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
  url = #"https://www.youtube.com/watch?v=bizGaTlDzZ4"
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
    %\override Clef #'break-visibility = #'#(#f #f #f)
    \override KeySignature #'break-visibility = #'#(#f #f #f)
    \override SystemStartBar #'collapse-height = #1
    \override ParenthesesItem.font-size = #2
    \override MultiMeasureRest #'expand-limit = #3
    %     \override NonMusicalPaperColumn #'line-break-permission = ##f
    %     \override NonMusicalPaperColumn #'page-break-permission = ##f
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



form = \markup  \fill-line {
  \column {  }
  \column { \line { \with-color #red \fontsize #2 "Solos on AABBA then D.S. al Fine" } }
}

harmonies = \chordmode {
  \set chordChanges = ##f
  \repeat unfold 7 { a1*2:m7 fis:m5-7 f/g }
  f/g s
  \repeat unfold 5 { c1*2:m7 a:m5-7 as/bes }
  as/bes s
  \repeat unfold 3 { a1*2:m7 fis:m5-7 f/g }
}


theNotes =  \relative c' {
  \clef "treble_8" \key c \major \time 4/4
  % \partial 8
  \override Score.RehearsalMark #'self-alignment-X = #LEFT
  \set Staff.ottavationMarkups = #ottavation-simple-ordinals
  \showStartRepeatBar \bar "[|:" \Intro
  \repeat volta 2 {
    <g c e>16
    _\markup "Rhy. Guitar Figure"
    r8 <g c d>16~ q2.~ | q1 |
    <g c e>16 r8 <g c d>16~ q4~ q8 <fis b d>4. | \break r8 <e a c>4.  r8 <e gis c>4. |
    <f a c>16 r8 q16~ q2.~ | q1 _\markup "Rhytmique Guitar Continue Simile"
  } \break \mark #1
  \repeat volta 2 {
    r2 r4 es'16 d8 c16 | r16 a8 g16 a4~ a r |
    r2 r8 c16 b~ b8 r8 | a16 fis r8 r4 \ottava #-1 e16 c8 b16 r16 a8 fis16 |
    g8 r16 g~ g4~ g \ottava #0 r16 c'8 b16 | r g8 f16 g8 g~ g2
  } \break
  \mark \markup { \bold \box B " Guitar Solo" }
  \repeat volta 2 { \comp #24 } \break \mark #3
  \repeat volta 2 {
    \grace g'8( a4) \grace g8( a4) es16 d c8~ c4~ | c2 r2 |
    \grace g'8( a4) \grace g8( a4) es16 d c8~ c4 |
    r8 a'->-. r a16 a a a r a r a8 16 |
    es16 d c8~ c4~ c \tuplet 3/2 { e8 c d~ } | d2. r4 \break
  }
  \mark \markup { \box D " Saxophone Solo" }
  \repeat volta 2 { \comp #24 } \break
  \once \override Score.RehearsalMark.extra-offset = #'(1.5 . -7)
  \mark #5
  b,4. c8 d4. e8 | fis4. g8 a4. b8 |
  c4. d8 e4. fis8 | gis4. a8 b4. c8 |
  d1~ | 2 r2 | \break
  R1 | b,,4. c8 d4. e8 |
  fis4. g8 a4. b8 | c4. d8 e4. fis8 |
  g1~ | 2 \tuplet 3/2 { r4 c e } | \break
  d4 b2.~ | b2 \tuplet 3/2 { r4 a d } | \tuplet 3/2 { b a, e'~ } e2 | e2. r4
  \break
  \mark \markup { \box F " Trombone Solo " \fontsize #-3 "(Rhy. guit. and Bass cont. 1 minor 3rd up)" }
  \repeat volta 2 {
    \comp #24
  } \break
  \mark \markup { \bold \box G " Guitar Solo over melody" }

  \repeat volta 2 {
    \grace g8( a4) \grace g8( a4) es16 d c8~ c4~ | c2 r2 |
    \grace g'8( a4) \grace g8( a4) es16 d c8~ c4 |
    r8 a'->-. r a16 a a a r a r a8 16 |
    es16 d c8~ c4~ c \tuplet 3/2 { g'8 es f~ } | f2. r4 \break
  }
  \mark \markup { \bold \box H " Guitar Solo" }
  \repeat volta 2 { \comp #24 } \break \mark #9
  d,4. es8 f4. g8 | a4. bes8 c4. d8 |
  es4. f8 g4. a8 | b!4. c8 d4. es8 |
  f1~ | 2 r2 | \break
  R1 | d,,4. es8 f4. g8 |
  a4. bes8 c4. d8 | es4. f8 g4. a8 |
  bes1~ | 2 \ottava #1 \tuplet 3/2 { r4 es g } | \break
  f4 d2.~ | d2 \tuplet 3/2 { r4 c f } | \tuplet 3/2 { d c, g'~ } g2 | g2. \ottava #0 r4
  \break
  \mark \markup { \bold \box J " Guitar Solo over melody " \fontsize #-3 "(Rhyt. guitar and bass play according to original chords)" }
  \repeat volta 2 {
    \grace g8( a4) \grace g8( a4) es16 d c8~ c4~ | c2 r2 |
    \grace g'8( a4) \grace g8( a4) es16 d c8~ c4 |
    r8 a'->-. r a16 a a a r a r a8 16 |
    es16 d c8~ c4~ c \tuplet 3/2 { e8 c d~ } | d2. r4 \break
  }
  \break
  \mark \markup { \bold \box K " Vamp. solo and fade" }
  \repeat volta 2 {
    \once \override TextScript #'extra-offset = #'( 1.5 . -0.5 )
    \grace g8( _\markup "Saxophone" a4) \grace g8( a4) es16 d c8~ c4~ | c2 r2 |
    \grace g'8( a4) \grace g8( a4) es16 d c8~ c4 |
    r8 a'->-. r a16 a a a r a r a8 16 |
    es16 d c8~ c4~ c \tuplet 3/2 { e8 c d~ } | d2. r4 \break
    \grace g8(  a4) \grace g8( a4) es16 d c8~ c4~ | c2 r2 |
    \grace g'8( a4) \grace g8( a4) es16 d c8~ c4 |
    r8 a'->-. r a16 a a a r a r a8 16 |
    es16 d c8~ c4~ c \tuplet 3/2 { e8 c d~ } | d2. r4
  }
}

chordsRhythm = \relative c' {
  \override Rest #'staff-position = #7
  \improvisationOn \override NoteHead.no-ledgers = ##t
  % \partial 8
  % \showStartRepeatBar \bar "[|:"
}

Fin = \relative c {
  \key c \major \time 4/4
  \set Staff.ottavationMarkups = #ottavation-simple-ordinals
  s1*86
  b4.^\markup "Trombone" c8 d4. e8 | fis4. g8 a4. b8 |
  \ottava #1 c4. d8 e4. fis8 | gis4. a8 b4. c8 |
  d1~ | 2 \ottava #0 r2 |
  R1 | b,,4. c8 d4. e8 |
  fis4. g8 a4. b8 | \ottava #1 c4. d8 e4. fis8 |
  g1~ | 2 \ottava #0 r2
}

Basse = \relative c {
  \clef "bass" \key c \major \time 4/4
  % \partial 8
  % \showStartRepeatBar \bar "[|:"
  a8. a'16 r4 r8 a, a'16 a, r8 | r a r4 r a16 a' g8 |
  fis,8. fis'16 r4 r8 fis, fis'16 fis, r8 | r fis r4 r fis16 fis' d8 |
  g,8. g'16 r4 r8 g, g'16 g, r8 | r g r4 r g16 g' gis8 |
  a,8. a'16 r4 r es'16 d8 c16 | r16 a8 g16 a4~ a r |
  r2 r8 c16 b~ b8 r8 | a16 fis r8 r4 e16 c8 b16 r16 a8 fis16 |
  g8 r16 g~ g4~ g r16 c'8 b16 | r g8 f16 g8 g~ g4 g,16 g' gis8
  a,8. a'16 r4 r8 a, a'16 a, r8 | r a r4 r a16 a' g8 |
  fis,8. fis'16 r4 r8 fis, fis'16 fis, r8 | r fis r4 r fis16 fis' d8 |
  g,8. g'16 r4 r8 g, g'16 g, r8 | r g r4 _\markup "Bass cont. sim." r g16 g' gis8 |
}


\book {
  \paper {
    #(set-paper-size "tablette")
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
          \new Staff \with { \RemoveEmptyStaves \override VerticalAxisGroup #'remove-first = ##t }
          { \clef "bass" \Fin }
          \new Staff \with { \RemoveEmptyStaves } \Basse
      >> >>
    } %\form
} }

\book {
  \paper {
    #(set-paper-size "tablette")
  }
  #(define output-suffix "BbTab")
  %\header { meter = \markup \with-color #red \bold "partition sur 2 pages" }
  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c d \harmonies }
        \new StaffGroup <<
          \new Staff \with { instrumentName = \Bb }
          <<
            %\new Voice \with { \consists "Pitch_squash_engraver" }
            \transpose c d \theNotes
          >>
          \new Staff \with { \RemoveEmptyStaves \override VerticalAxisGroup #'remove-first = ##t }
          { \transpose c d' \Fin }
      >> >>
    } %\form
} }

\book {
  \paper {
    #(set-paper-size "tablette")
  }
  #(define output-suffix "EbTab")
  %\header { meter = \markup \with-color #red \bold "partition sur 2 pages" }
  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c a \harmonies }
        \new StaffGroup <<
          \new Staff \with { instrumentName = \Eb }
          <<
            %\new Voice \with { \consists "Pitch_squash_engraver" }
            \transpose c a, \theNotes
          >>
          \new Staff \with { \RemoveEmptyStaves \override VerticalAxisGroup #'remove-first = ##t }
          { \transpose c a' \Fin }
      >> >>
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
          \new Staff \with { \RemoveEmptyStaves \override VerticalAxisGroup #'remove-first = ##t }
          { \clef "bass" \Fin }
          \new Staff \with { \RemoveEmptyStaves } \Basse
      >> >>
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
          \new Staff \with { instrumentName = \Bb }
          <<
            %\new Voice \with { \consists "Pitch_squash_engraver" }
            \transpose c d \theNotes
          >>
          \new Staff \with { \RemoveEmptyStaves \override VerticalAxisGroup #'remove-first = ##t }
          { \transpose c d' \Fin }
      >> >>
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
          \new Staff \with { instrumentName = \Eb }
          <<
            %\new Voice \with { \consists "Pitch_squash_engraver" }
            \transpose c a, \theNotes
          >>
          \new Staff \with { \RemoveEmptyStaves \override VerticalAxisGroup #'remove-first = ##t }
          { \transpose c a' \Fin }
      >> >>
} } }

% \book {
%   \paper {
%     #(set-paper-size "tablette")
%     page-count = #1
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
%     page-count = #1
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
%         ragged-right = ##f
%         ragged-last = ##f
%         \context {
%           \Score
%           \remove "Volta_engraver"
%           \omit Clef % Cacher la clef
%           \omit TimeSignature % cacher la métrique
%           \omit BarNumber
%           \override SpacingSpanner.strict-note-spacing = ##t
%           proportionalNotationDuration = #(ly:make-moment 1/16)
%         }
%       }
%       <<
%         \new Staff \with {
%           \remove "Staff_symbol_engraver"
%         }
%         \marques
%         \new ChordNames \with {
%           \override ChordName.extra-offset = #'(10 . -1 )
%           \override ParenthesesItem.extra-offset = #'(10 . -1 )
%           \override BarLine.bar-extent = #'(-5 . 5)
%           \consists "Bar_engraver"
%           \override StaffSymbol.line-positions = #'( -10 10 )
%           \consists "Staff_symbol_engraver"
%           \consists "Percent_repeat_engraver"
%           \consists "Volta_engraver"
%         }
%         \grille
%       >>
% } } }

% \book {
%   %\paper { page-count = #1 #(set-paper-size "a4")}
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
%         ragged-right = ##f
%         ragged-last = ##f
%         \context {
%           \Score
%           \remove "Volta_engraver"
%           \omit Clef % Cacher la clef
%           \omit TimeSignature % cacher la métrique
%           \omit BarNumber
%           \override SpacingSpanner.strict-note-spacing = ##t
%           proportionalNotationDuration = #(ly:make-moment 1/16)
%         }
%       }
%       <<
%         \new Staff \with {
%           \remove "Staff_symbol_engraver"
%         }
%         \marques
%         \new ChordNames \with {
%           \override ChordName.extra-offset = #'(10 . -1 )
%           \override ParenthesesItem.extra-offset = #'(10 . -1 )
%           \override BarLine.bar-extent = #'(-5 . 5)
%           \consists "Bar_engraver"
%           \override StaffSymbol.line-positions = #'( -10 10 )
%           \consists "Staff_symbol_engraver"
%           \consists "Percent_repeat_engraver"
%           \consists "Volta_engraver"
%         }
%         \transpose c a \grille
%       >>
% } } }

% \book {
%   %\paper { page-count = #2 #(set-paper-size "tablette")}
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